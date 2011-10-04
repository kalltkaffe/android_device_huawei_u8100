package com.cyanogenmod.U8100Parts;

import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.os.Bundle;
import android.view.View;
import android.view.MotionEvent;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;

public class U8100Parts extends Activity {
   final private static String TAG = "U8100Parts";

   private View view;

   private int readValue(String parameter) {
      try {
         BufferedReader buf = new BufferedReader(new InputStreamReader(new FileInputStream(new File("/sys/module/msm_touch/parameters/tscal_" + parameter))));
         String readString = new String();
         if((readString = buf.readLine()) != null)
            return Integer.parseInt(readString);
      } catch (FileNotFoundException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      return 0;
   }

   /** Called when the activity is first created. */
   @Override
   public void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      // Read current values
      final int xoffset = (readValue("xoffset")*240+480)/960;
      final int yoffset = (readValue("yoffset")*320+460)/920;
      final int xscale = readValue("xscale");
      final int yscale = readValue("yscale");

      view = new View(this) {

         private int step = 1;
         private int rawx1;
         private int rawy1;
         private int rawx2;
         private int rawy2;

         private void writeValue(String parameter, int value) {
            try {
               FileOutputStream fos = new FileOutputStream(new File("/sys/module/msm_touch/parameters/tscal_" + parameter));
               fos.write(String.valueOf(value).getBytes());
               fos.flush();
               fos.getFD().sync();
               fos.close();
            } catch (FileNotFoundException e) {
               e.printStackTrace();
            } catch (IOException e) {
               e.printStackTrace();
            }
         }

         @Override
         public boolean onTouchEvent(MotionEvent ev) {
            if (ev.getAction() != MotionEvent.ACTION_UP)
               return true;
	    if(step==1) {
               rawx1 = ((int)ev.getRawX()*65536-xoffset+32768)/xscale;
               rawy1 = ((int)ev.getRawY()*65536-yoffset+32768)/yscale;
               if(rawx1<100 && rawy1<100)
                  step = 2;
            } else if(step==2) {
               rawx2 = ((int)ev.getRawX()*65536-xoffset+32768)/xscale;
               rawy2 = ((int)ev.getRawY()*65536-yoffset+32768)/yscale;
               if(rawx2>140 && rawy2>220)
                  step = 3;
            } else {
               int distx = rawx2 - rawx1;
               int new_xscale = (140*65536 + distx/2)/distx;
               int disty = rawy2 - rawy1;
               int new_yscale = (220*65536 + disty/2)/disty;
               int new_xoffset = 1;
               new_xoffset += 50*65536-rawx1*new_xscale;
               new_xoffset += 190*65536-rawx2*new_xscale;
               new_xoffset /= 2;
               new_xoffset = (new_xoffset*960+120)/240;
               int new_yoffset = 1;
               new_yoffset += 50*65536-rawy1*new_yscale;
               new_yoffset += 270*65536-rawy2*new_yscale;
               new_yoffset /= 2;
               new_yoffset = (new_yoffset*920+160)/320;
               // Pass new calibration to kernel
               writeValue("xoffset", new_xoffset);
               writeValue("yoffset", new_yoffset);
               writeValue("xscale", new_xscale);
               writeValue("yscale", new_yscale);
               // Save calibraiton data to /data/system/pointercal
               StringBuilder sb = new StringBuilder();
               sb.append(new_xscale);
               sb.append(" ");
	       sb.append(0);
               sb.append(" ");
	       sb.append(new_xoffset);
               sb.append(" ");
	       sb.append(0);
               sb.append(" ");
	       sb.append(new_yscale);
               sb.append(" ");
	       sb.append(new_yoffset);
               sb.append(" ");
	       sb.append(65536);

               try {
                  FileOutputStream fos = new FileOutputStream(new File("/data/system/pointercal"));
                  fos.write(sb.toString().getBytes());
                  fos.flush();
                  fos.getFD().sync();
                  fos.close();
               } catch (FileNotFoundException e) {
                  e.printStackTrace();
               } catch (IOException e) {
                  e.printStackTrace();
               }
               finish();
            }
            invalidate();
            return true;
         }

         @Override
         protected void onDraw(Canvas canvas) {
            canvas.drawColor(Color.BLACK);
            if(step==1)
                drawTarget(canvas, 50, 50);
            else if(step==2)
                drawTarget(canvas, 190, 270);
            else
                drawTarget(canvas, 120, 160);
         }

         private void drawTarget(Canvas c, int x, int y) {
            Paint white = new Paint(Paint.ANTI_ALIAS_FLAG);
            Paint blue = new Paint(Paint.ANTI_ALIAS_FLAG);
            white.setColor(Color.WHITE);
            blue.setColor(Color.BLUE);
            c.drawCircle(x, y, 25, blue);
            c.drawCircle(x, y, 21, white);
            c.drawCircle(x, y, 17, blue);
            c.drawCircle(x, y, 13, white);
            c.drawCircle(x, y, 9, blue);
            c.drawCircle(x, y, 5, white);
            c.drawCircle(x, y, 1, blue);
            if(step==3) {
               white.setTextAlign(Paint.Align.CENTER);
               white.setTextSize(24);
               c.drawText("Calibration done!",x,y-50,white);
               c.drawText("Touch screen to set.",x,y+70,white);
               c.drawText("Press BACK to cancel.",x,y+120,white);
            }
         }

      };

      setContentView(view);
   }

}
