package com.mr.gassensor;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.stream.Stream;

public class DataPreProcessor {

	public static void main(String[] args) {
		
		 FileWriter fw = null;
		
		 try {
	          	Path writePath = Paths.get("/home/puneet/mr/preprocess/batch1.dat");
	          	
			    boolean deleted = Files.deleteIfExists(writePath);
			    
			    if (deleted) {
			    	System.out.println("Previous file deleted");
			    }
			    
	            File newTextFile = new File("/home/puneet/mr/preprocess/batch1.dat");

	            fw = new FileWriter(newTextFile);

	        } catch (IOException iox) {
	            //do stuff with exception
	            iox.printStackTrace();
	        }		
		
			Stream<String> s = null;
			
			try {
				s = Files.lines(Paths.get("/home/puneet/mr/driftdataset/batch1.dat"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			Iterator<String> iterator = s.iterator();
			
			while (iterator.hasNext()) {
				String line = iterator.next();
				String[] data = line.split(" ");
				
				String[] gasLabelConc = data[0].split(";");
				
				writeData(gasLabelConc[0],fw, true);
				writeData(gasLabelConc[1],fw, true);
				
				String sensorReading = "";
				
				for (int i=1; i <= 128; i++) {
					
					sensorReading = data[i].split(":")[1];
					
					boolean isLastColumn = i == 128;
					
					writeData(sensorReading,fw, !isLastColumn);
					
					if (isLastColumn) {
						writeData("\n",fw,false);
					}
				}
			}
			try {
				fw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
	}
	
	private static void writeData(String data, FileWriter fw, boolean addSpace) {
        try {
        	
        	String writeStr = addSpace ? data + " " : data;
        	
        	fw.write(writeStr);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
