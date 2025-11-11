package dao;

import models.ClassSchedule;
import utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ScheduleDAO {

    public boolean addSchedule(ClassSchedule s) {
        String sql = "INSERT INTO class_schedule (title, description, teacher_id, class_date, start_time, end_time) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, s.getTitle());
            ps.setString(2, s.getDescription());
            ps.setInt(3, s.getTeacherId());
            ps.setDate(4, s.getClassDate());
            ps.setTime(5, s.getStartTime());
            ps.setTime(6, s.getEndTime());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    public List<ClassSchedule> getAllSchedules() {
        List<ClassSchedule> list = new ArrayList<>();
        String sql = "SELECT * FROM class_schedule ORDER BY class_date DESC, start_time";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ClassSchedule s = new ClassSchedule();
                s.setId(rs.getInt("id"));
                s.setTitle(rs.getString("title"));
                s.setDescription(rs.getString("description"));
                s.setTeacherId(rs.getInt("teacher_id"));
                s.setClassDate(rs.getDate("class_date"));
                s.setStartTime(rs.getTime("start_time"));
                s.setEndTime(rs.getTime("end_time"));
                list.add(s);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public List<ClassSchedule> getSchedulesByTeacher(int teacherId) {
        List<ClassSchedule> list = new ArrayList<>();
        String sql = "SELECT * FROM class_schedule WHERE teacher_id = ? ORDER BY class_date DESC, start_time";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, teacherId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ClassSchedule s = new ClassSchedule();
                s.setId(rs.getInt("id"));
                s.setTitle(rs.getString("title"));
                s.setDescription(rs.getString("description"));
                s.setTeacherId(rs.getInt("teacher_id"));
                s.setClassDate(rs.getDate("class_date"));
                s.setStartTime(rs.getTime("start_time"));
                s.setEndTime(rs.getTime("end_time"));
                list.add(s);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public ClassSchedule findById(int id) {
        String sql = "SELECT * FROM class_schedule WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ClassSchedule s = new ClassSchedule();
                s.setId(rs.getInt("id"));
                s.setTitle(rs.getString("title"));
                s.setDescription(rs.getString("description"));
                s.setTeacherId(rs.getInt("teacher_id"));
                s.setClassDate(rs.getDate("class_date"));
                s.setStartTime(rs.getTime("start_time"));
                s.setEndTime(rs.getTime("end_time"));
                return s;
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }
}
