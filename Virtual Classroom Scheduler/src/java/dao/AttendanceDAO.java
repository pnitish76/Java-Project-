package dao;

import models.Attendance;
import utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AttendanceDAO {

    public boolean markAttendance(int scheduleId, int studentId, String status, int markedBy) {
        String checkSql = "SELECT id FROM attendance WHERE schedule_id=? AND student_id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement check = conn.prepareStatement(checkSql)) {
            check.setInt(1, scheduleId);
            check.setInt(2, studentId);
            ResultSet rs = check.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                String upd = "UPDATE attendance SET status=?, marked_by=?, marked_at=NOW() WHERE id=?";
                try (PreparedStatement ps = conn.prepareStatement(upd)) {
                    ps.setString(1, status);
                    ps.setInt(2, markedBy);
                    ps.setInt(3, id);
                    return ps.executeUpdate() > 0;
                }
            } else {
                String ins = "INSERT INTO attendance (schedule_id, student_id, status, marked_by) VALUES (?, ?, ?, ?)";
                try (PreparedStatement ps = conn.prepareStatement(ins)) {
                    ps.setInt(1, scheduleId);
                    ps.setInt(2, studentId);
                    ps.setString(3, status);
                    ps.setInt(4, markedBy);
                    return ps.executeUpdate() > 0;
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    public List<Attendance> getAttendanceBySchedule(int scheduleId) {
        List<Attendance> list = new ArrayList<>();
        String sql = "SELECT * FROM attendance WHERE schedule_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, scheduleId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Attendance a = new Attendance();
                a.setId(rs.getInt("id"));
                a.setScheduleId(rs.getInt("schedule_id"));
                a.setStudentId(rs.getInt("student_id"));
                a.setStatus(rs.getString("status"));
                a.setMarkedBy((Integer)rs.getObject("marked_by"));
                a.setMarkedAt(rs.getTimestamp("marked_at"));
                list.add(a);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public List<Attendance> getAttendanceByStudent(int studentId) {
        List<Attendance> list = new ArrayList<>();
        String sql = "SELECT a.* FROM attendance a JOIN class_schedule s ON a.schedule_id = s.id WHERE a.student_id = ? ORDER BY s.class_date DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Attendance a = new Attendance();
                a.setId(rs.getInt("id"));
                a.setScheduleId(rs.getInt("schedule_id"));
                a.setStudentId(rs.getInt("student_id"));
                a.setStatus(rs.getString("status"));
                a.setMarkedBy((Integer)rs.getObject("marked_by"));
                a.setMarkedAt(rs.getTimestamp("marked_at"));
                list.add(a);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
}
