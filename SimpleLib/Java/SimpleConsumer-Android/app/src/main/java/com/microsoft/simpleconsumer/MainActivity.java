package com.microsoft.simpleconsumer;

import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import simplelib_android.simplelib.Adder;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Adder adder = new Adder(2, 3);

        new AlertDialog.Builder(this)
                .setMessage("2 + 3 = " + adder.value())
                .setPositiveButton("OK", null)
                .show();
    }
}
