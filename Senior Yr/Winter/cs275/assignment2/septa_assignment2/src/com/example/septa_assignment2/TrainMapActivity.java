package com.example.septa_assignment2;

import java.io.IOException;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Activity;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;

public class TrainMapActivity extends Activity{

	private ImageView imageMap;
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		imageMap = (ImageView) findViewById(R.id.imageMap);
		

	}

	private class goGetMapAsyncTask extends AsyncTask<String, Integer, String>{

		@Override
		protected String doInBackground(String... params) {
			
			HttpClient httpclient = new DefaultHttpClient();
			HttpGet httpget = new HttpGet("http://www.reddit.com/.json");

			try {
				// Add your data
				// Execute HTTP Post Request
				HttpResponse response = httpclient.execute(httpget);
				String responseStr = EntityUtils.toString(response.getEntity());
				return responseStr;
			} catch (ClientProtocolException e) {
				// TODO Auto-generated catch block
				Log.w("Septa",e.getStackTrace().toString());
			} catch (IOException e) {
				Log.w("Septa",e.getStackTrace().toString());
			}
			return null;
		}
		
		protected void onPostExecute(String result){
			
		}
	}

	

	

	
	
}
