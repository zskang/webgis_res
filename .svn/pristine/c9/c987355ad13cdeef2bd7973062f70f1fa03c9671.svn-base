package com.cabletech.core.common;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.net.URL;
import java.util.Date;

import javax.imageio.ImageIO;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
/**
 * 地图打印
 * @author Administrator
 *
 */
public class PrintMap {
	//Export Map
	/**
	 * 地图导出
	 * @param src_zq 
	 * @param src_zy 
	 * @param ctx 
	 */
	public static String getExportMapImg(String src_zq, String src_zy,String ctx) {
		String filename = new Date().getTime()+".png";
        String new_src = ctx+"\\"+filename;
		try {
			URL url_zq = new URL(src_zq);
			BufferedImage bi_zq = ImageIO.read(url_zq);
			URL url_zy = new URL(src_zy);
			BufferedImage bi_zy = ImageIO.read(url_zy);
			int width = bi_zq.getWidth();
			int height = bi_zq.getHeight();
			Graphics2D graphics = bi_zq.createGraphics();
			graphics.drawImage(bi_zq, 0, 0, width, height, null); 
			graphics.drawImage(bi_zy, 0, 0, width, height, null);
            graphics.dispose(); 
            FileOutputStream out = new FileOutputStream(new_src);  
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);  
            // 绘制新的文件 
            encoder.encode(bi_zq);
            out.close();
		} catch (Exception ex) {
			return "";
		}
		return filename;
	}
}
