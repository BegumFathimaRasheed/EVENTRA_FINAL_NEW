/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import classes.User;
import static classes.User.getFullNameFromUser;

/**
 *
 * @author DELL
 */
public class Parchase {

    private int form_id;
    private String event;
    private String category;
    private String venue;
    private String date;
    private String time;
    private int count;
    private String info;
    private String bill;
    private String card_holder;
    private String card_no;
    private String exdate;
    private String cvv;

    public Parchase(String event, String category, String venue, String date, String time, int count, String info, String card_holder, String card_no) {
        this.event = event;
        this.category = category;
        this.venue = venue;
        this.date = date;
        this.time = time;
        this.count = count;
        this.info = info;
        this.card_holder = card_holder;
        this.card_no = card_no;
    }

    public Parchase(String event, String category, String venue, String date, String time, int count, String info) {
        this.event = event;
        this.category = category;
        this.venue = venue;
        this.date = date;
        this.time = time;
        this.count = count;
        this.info = info;
    }

    public int getFormId() {
        return form_id;
    }

    public void setFormId(int form_id) {
        this.form_id = form_id;
    }

    public String getEvent() {
        return event;
    }

    public void setEvent(String event) {
        this.event = event;
    }

    public String getCat() {
        return category;
    }

    public void setCat(String category) {
        this.category = category;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getBill() {
        return bill;
    }

    public void setBill(String bill) {
        this.bill = bill;
    }

    public String getCardHolder() {
        return card_holder;
    }

    public void setCardHolder(String card_holder) {
        this.card_holder = card_holder;
    }

    public String getCardNo() {
        return card_no;
    }

    public void setCardNo(String card_no) {
        this.card_no = card_no;
    }

    public String getExDate() {
        return exdate;
    }

    public String getCvv() {
        return cvv;
    }

    public String getFirstName(Connection con, int id) throws SQLException {
        User user = User.getUsersId(con, id);
        if (user != null) {
            return user.getFirstName();
        }
        return "Unknown";
    }

    public String getLastName(Connection con, int id) throws SQLException {
        User user = User.getUsersId(con, id);
        if (user != null) {
            return user.getLastName();
        }
        return "Unknown";
    }

    public String getEventName(Connection con, int event_id) throws SQLException {
        Event event = Event.getEventsId(con, event_id);
        if (event != null) {
            return event.getEventName();
        }
        return "Unknown";
    }

    public String getEventCat(Connection con, int event_id) throws SQLException {
        Event event = Event.getEventsId(con, event_id);
        if (event != null) {
            return event.getEventCat();
        }
        return "Unknown";
    }

    public String getEventBill(Connection con, int event_id) throws SQLException {
        Event event = Event.getEventsId(con, event_id);
        if (event != null) {
            return event.getEventBill();
        }
        return "Unknown";
    }

    public boolean form(Connection con) throws SQLException {
        String query = "INSERT INTO form(event, category, venue, date, time, count, info, card_holder, card_no) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?) ";
        PreparedStatement pstmt = con.prepareStatement(query);

//    String userName = getFirstName(con, id) + " " + getLastName(con, id); // Fetch user's first and last name
//    String eventInfo = getEventName(con, event_id);
//    String eventCat = getEventCat(con, event_id);
//    String eventBill = getEventBill(con, event_id);
//    pstmt.setString(1, userName); 
        pstmt.setString(1, event);
        pstmt.setString(2, category);
        pstmt.setString(3, venue);
        pstmt.setString(4, date);
        pstmt.setString(5, time);
        pstmt.setInt(6, count);
        pstmt.setString(7, info);
        pstmt.setString(8, card_holder);
        pstmt.setString(9, card_no);

        int rowsInserted = pstmt.executeUpdate();
        return rowsInserted > 0;
    }

    public static List<Parchase> displayParchaseDetails(Connection con) throws SQLException {
        List<Parchase> parchase_list = new ArrayList<>();
        String query = "SELECT * FROM form";
        PreparedStatement pstmt = con.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("form_id");
            String event = rs.getString("event");
            String category = rs.getString("category");
            String venu = rs.getString("venue");
            String date = rs.getString("date");
            String time = rs.getString("time");
            int count = rs.getInt("count");
            String info = rs.getString("info");

            Parchase form = new Parchase(event, category, venu, date, time, count, info);
            form.setFormId(id);
            parchase_list.add(form);
        }
        return parchase_list;
    }
    
    public static boolean delete(Connection con, int id) throws SQLException{
        String query = "DELETE FROM form WHERE form_id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, id);
        int a = pstmt.executeUpdate();
        return (a>0);
    }
}
