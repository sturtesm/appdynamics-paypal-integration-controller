package com.appdynamics.samples;

import static org.junit.Assert.assertTrue;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Date;

import org.junit.Test;

/**
 * Long duration nnit test for simple App, b/c the class doesn't end it "Test" it
 * shouldn't get executed automatically.
 */
public class LongDurationTest 
{
    private final static int TEST_DURATION_SECS=72000;
    private final static String HOST="52.4.98.130";
    private final static String PORT="8888";
    //private final static String HOST="127.0.0.1";
	//private final static String PORT="8081";
	
	private Date testStart = new Date();

	private ArrayList<String> urlList = new ArrayList<String> ();
	
	private String buildAbsoluteURL(String url) {
		String port = (PORT == null) ? "" : ":" + PORT;
		
		return String.format("http://%s%s/%s", HOST, port, url);
	}

	public LongDurationTest()
	{
		urlList.add(buildAbsoluteURL("paypal-online-store"));
		urlList.add(buildAbsoluteURL("paypal-online-store/addcard"));
		urlList.add(buildAbsoluteURL("paypal-online-store/checkout"));
		urlList.add(buildAbsoluteURL("paypal-online-store/accountHistory"));
		urlList.add(buildAbsoluteURL("paypal-online-store/accountLookup"));
	}

	private boolean shouldTest() {
		long start = testStart.getTime() / 1000;
		long now = new Date().getTime() / 1000;

		return (now - start < TEST_DURATION_SECS) ? true : false;

	}

	@Test
	public void TestController() {
		boolean success = true;
		try {
			while (shouldTest()) {
				for (String address : urlList) {
					
					try {
						hitUrl(address);
					}
					catch (Exception e) {
						//nothing to do here
						e.printStackTrace();
					}
					
					try {
						Thread.sleep(1000);
					}
					catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			success = false;
		}

		assertTrue(success);
	}

	private void hitUrl(String address) throws Exception {
		URL url = new URL(address);

		URLConnection urlConn = url.openConnection();
		
		BufferedReader in = new BufferedReader(
				new InputStreamReader(
						urlConn.getInputStream()));
		String inputLine;

		String page = "";
		while ((inputLine = in.readLine()) != null) {
			page += inputLine;
		}
		System.out.println(page);
		
		in.close();
	}

}
