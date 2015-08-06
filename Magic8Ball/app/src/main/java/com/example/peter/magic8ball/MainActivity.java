package com.example.peter.magic8ball;

import android.provider.CalendarContract;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import java.util.Random;

class Magic8BallModel extends Object {
    public Magic8BallModel () {

        responseArray = new String[]{"Heck Yes!", "Heck No!", "Maybe?"};
    }
    public String[] responseArray;

    public void randomSelection(){
        System.out.println(responseArray[new Random().nextInt(responseArray.length)]);
    }
}


public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        System.out.println("Peter Mavridis");
        double age = 102.48394;
        System.out.printf("My age: %.2f", age);
        System.out.println();
        String myName = "Peter Mavridis";
        System.out.println(myName);

        Magic8BallModel eightBall = new Magic8BallModel();

        System.out.println("Will I get full marks for this lab?");
        eightBall.randomSelection();
        System.out.println("Will the Cronulla Sharks receive a premiership this year?");
        eightBall.randomSelection();
        System.out.println("Will I end up becoming a cat person when I get old?");
        eightBall.randomSelection();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
