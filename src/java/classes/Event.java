/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class Event {

    private int event_id;
    private String event;
    private String category;
    private String price;

    public Event(String event, String category, String price) {
        this.event = event;
        this.category = category;
        this.price = price;
    }

    public void setEventId(int event_id) {
        this.event_id = event_id;
    }

    public int getEventId() {
        return event_id;
    }

    public String getEventName() {
        return event;
    }

    public void setEventName(String event) {
        this.event = event;
    }

    public String getEventCat() {
        return category;
    }

    public void setEventCat(String category) {
        this.category = category;
    }

    public String getEventBill() {
        return price;
    }

    public void setEventBill(String category) {
        this.price = price;
    }

    public static Event getEventById(Connection con, int event_id) throws SQLException {
        Event event = null;
        String query = "SELECT * FROM event WHERE event_id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, event_id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    event = new Event(rs.getString("event"), rs.getString("category"), rs.getString("price"));
                    event.setEventId(rs.getInt("event_id"));
                }
            }
        }
        return event;
    }

    public static Event getEventsId(Connection con, int event_id) throws SQLException {
        Event event = getEventById(con, event_id);
        return event;
    }

    public static int getEventIdByName(Connection con, String event, String category) throws SQLException {
        int eventId = -1; // Default value if event not found

        String query = "SELECT event_id FROM event WHERE event = ? AND category = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, event);
            pstmt.setString(2, category);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    eventId = rs.getInt("event_id");
                }
            }
        }

        return eventId;
    }

    public static String getEventPrice(Connection con, int eventId) throws SQLException {
        String eventPrice = "Unknown"; // Default value if event price is not found

        String query = "SELECT price FROM event WHERE event_id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, eventId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    eventPrice = rs.getString("price");
                }
            }
        }

        return eventPrice;
    }

    public static List<Event> displayEventDetails(Connection con) throws SQLException {
        List<Event> event_list = new ArrayList<>();
        String query = "SELECT * FROM event";
        PreparedStatement pstmt = con.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            int event_id = rs.getInt("event_id");
            String event = rs.getString("event");
            String category = rs.getString("category");
            String price = rs.getString("price");

            Event ev = new Event(event, category, price);
            ev.setEventId(event_id);
            event_list.add(ev);
        }
        return event_list;
    }
    
    public static boolean delete(Connection con, int id) throws SQLException{
        String query = "DELETE FROM event WHERE event_id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, id);
        int a = pstmt.executeUpdate();
        return (a>0);
    }

}
