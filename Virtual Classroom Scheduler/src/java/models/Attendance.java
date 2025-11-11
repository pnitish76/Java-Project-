package models;

import java.sql.Timestamp;

public class Attendance {
    private int id;
    private int scheduleId;
    private int studentId;
    private String status;
    private Integer markedBy;
    private Timestamp markedAt;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getScheduleId() { return scheduleId; }
    public void setScheduleId(int scheduleId) { this.scheduleId = scheduleId; }
    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public Integer getMarkedBy() { return markedBy; }
    public void setMarkedBy(Integer markedBy) { this.markedBy = markedBy; }
    public Timestamp getMarkedAt() { return markedAt; }
    public void setMarkedAt(Timestamp markedAt) { this.markedAt = markedAt; }
}
