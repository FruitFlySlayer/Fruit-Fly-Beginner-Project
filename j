package sample;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.geometry.Insets;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

/**
 * Write a description of JavaFX class f here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Main extends Application
{
    // We keep track of the count, and label displaying the count:
    private int count = 0;
    private int upgradeCount = 0;
    private Label myLabel = new Label("0");
    private Label fruitFlyLabel = new Label("Fruit Fly Killing Simulator");

    @Override
    public void start(Stage stage) throws Exception
    {
        // Create a Button or any control item
        Button myButton = new Button("Kill Fruit Flies");
        Button upgradeButton = new Button("Upgrade");
        // Create a new grid pane
        GridPane pane = new GridPane();
        pane.setPadding(new Insets(10, 10, 10, 10));
        pane.setMinSize(300, 300);
        pane.setVgap(10);
        pane.setHgap(10);

        //set an action on the button using method reference
        myButton.setOnAction(this::buttonClick);
        upgradeButton.setOnAction(this::buttonUpgrade);

        // Add the button and label into the pane
        pane.add(myLabel, 1, 3);
        pane.add(fruitFlyLabel, 0, 0);
        pane.add(myButton, 0, 3);
        pane.add(upgradeButton, 0, 5);

        // JavaFX must have a Scene (window content) inside a Stage (window)
        Scene scene = new Scene(pane, 300,300);
        stage.setTitle("Fruit Fly Killing Simulator");
        stage.setScene(scene);

        // Show the Stage (window)
        stage.show();
    }

    /**
     * This will be executed when the button is clicked
     * It increments the count by 1
     */
    private void buttonClick(ActionEvent event)
    {
        // Counts number of button clicks and shows the result on a label
        count = count + (1 + upgradeCount);
        myLabel.setText(Integer.toString(count));
    }
    private void buttonUpgrade(ActionEvent event)
    {   if((count - (20 + (20 * upgradeCount))) >= 0) {
        count = count - (20 + (20 * upgradeCount));
        upgradeCount++;
        myLabel.setText(Integer.toString(count));
    }
    else{
        myLabel.setText("You cannot upgrade!");
    }
    }

}
