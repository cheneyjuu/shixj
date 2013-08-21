package com.chen.shixj.utility;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * User: Juchen
 * Date: 13-8-16
 * Time: 上午9:05
 */
public class FileHash {
    public static byte[] createChecksum(String filename) {
        InputStream fis;
        MessageDigest complete = null;
        try {
            fis = new FileInputStream(filename);
            byte[] buffer = new byte[1024];
            complete = MessageDigest.getInstance("MD5");
            int numRead;

            do {
                numRead = fis.read(buffer);
                if (numRead > 0) {
                    complete.update(buffer, 0, numRead);
                }
            } while (numRead != -1);

            fis.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return complete.digest();
    }

    public static String getMD5Checksum(String filename) {
        byte[] b = createChecksum(filename);
        String result = "";

        for (int i=0; i < b.length; i++) {
            result += Integer.toString( ( b[i] & 0xff ) + 0x100, 16).substring( 1 );
        }
        return result;
    }

    public static void main(String[] args){
        try {
            String hash = getMD5Checksum("/Users/juchen/Documents/workflow.png");
            System.out.println(hash);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
