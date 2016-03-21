package com.example.peter.magic8ball;

import android.provider.CalendarContract;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.view.KeyEvent;
import android.widget.TextView.OnEditorActionListener;


import java.util.Random;

class Magic8BallModel extends Object {
    public Magic8BallModel () {

        responseArray = new String[]{"Heck Yes!", "Heck No!", "Maybe?"};
        imageArray = new int[]{
                R.drawable.circle1,
                R.drawable.circle2,
                R.drawable.circle3,
                R.drawable.circle4,
                R.drawable.circle5,
                R.drawable.circle6
        };
        
    }
    public String[] responseArray;
    public int[] imageArray;
    Random r = new Random();



}


public class MainActivity extends AppCompatActivity {
    EditText textView3;
    EditText textGo;
    Button shakeGo;
    TextView textView2;
    ImageView imageView2;
    Magic8BallModel eightBall;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // For the shake button.
        shakeGo = (Button) findViewById(R.id.button);
        shakeGo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                selectRandom();
            }
        });


        // For the Go button on the keyboard.
        // Getting reference to the EditText
        textGo = (EditText) findViewById(R.id.textView3);
        // Setting EditorActionListener for the EditText
        textGo.setOnEditorActionListener(new OnEditorActionListener() {

            @Override
            public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
                if(actionId==EditorInfo.IME_ACTION_GO){
                    selectRandom();
                }
                return false;
            }
        });
        /*
        System.out.println("Peter Mavridis");
        double age = 102.48394;
        System.out.printf("My age: %.2f", age);
        System.out.println();
        String myName = "Peter Mavridis";
        System.out.println(myName);

        System.out.println("Will I get full marks for this lab?");
        eightBall.randomSelection();
        System.out.println("Will the Cronulla Sharks receive a premiership this year?");
        eightBall.randomSelection();
        System.out.println("Will I end up becoming a cat person when I get old?");
        eightBall.randomSelection();
        */
        textView2 = (TextView) findViewById(R.id.textView2);
        textView3 = (EditText) findViewById(R.id.textView3);
        imageView2 = (ImageView) findViewById(R.id.imageView2);
        eightBall = new Magic8BallModel();
        textView3.setImeOptions(EditorInfo.IME_ACTION_GO);
    }
    public void selectRandom(){
        textView2.setText(eightBall.responseArray[new Random().nextInt(eightBall.responseArray.length)]);
        int rand = (int)(Math.random()* 5);
        int randomInt = eightBall.r.nextInt(eightBall.imageArray.length);
        imageView2.setBackgroundResource(eightBall.imageArray[randomInt]);
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
