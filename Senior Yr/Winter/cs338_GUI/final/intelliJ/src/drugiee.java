package drugiee;

import java.awt.*;

import javax.swing.*;
import javax.swing.border.EmptyBorder;

public class Drugiee extends JFrame {

    private JTextField drugSearchBox;
    private JList searchResults;
    private JLabel drugTitle;
    private JTextArea drugInfo;

    public drugiee() {
        Container pane = getContentPane();
        //pane.setLayout(new GridBagLayout());
        JPanel mainPane = new JPanel();

        mainPane.setBorder(new EmptyBorder(10,10,10,10));
        mainPane.setLayout(new GridBagLayout());
        GridBagConstraints c = new GridBagConstraints();

        drugSearchBox = new JTextField("Search Drug Name");
        drugSearchBox.setColumns(30);

        c.weightx = .5;
        c.insets = new Insets(1,1,1,1);
        c.fill = GridBagConstraints.HORIZONTAL;
        c.gridx = 0;
        c.gridy = 0;
        mainPane.add(drugSearchBox, c);

        // Create some items to add to the list
        String listData[] = { "Search Results: Empty" };

        searchResults = new JList(listData);
        c.weighty = .5;
        c.gridx = 0;
        c.gridy = 1;

        mainPane.add(searchResults,c);

        drugTitle = new JLabel("Drug Title");
        c.gridx = 1;
        c.gridy = 0;
        mainPane.add(drugTitle,c);

        drugInfo = new JTextArea();
        drugInfo.setLineWrap( true );
        drugInfo.setWrapStyleWord( true );
        drugInfo.setColumns(40);
        //drugInfo.setRows(50);
        c.gridx = 1;
        c.gridy = 1;
        mainPane.add(drugInfo, c);

        pane.add(mainPane);
    }

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        drugiee.drugiee frame = new drugiee.drugiee();
        frame.setTitle("Drugiee");
        //frame.setLocationRelativeTo( null );
        frame.pack();
        frame.setVisible(true);
    }

}
