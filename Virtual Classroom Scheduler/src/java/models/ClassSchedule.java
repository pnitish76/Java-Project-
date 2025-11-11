package models;

import java.sql.Date;
import java.sql.Time;

public class ClassSchedule {
    private int id;
    private String title;
    private String description;
    private int teacherId;
    private Date classDate;
    private Time startTime;
    private Time endTime;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public int getTeacherId() { return teacherId; }
    public void setTeacherId(int teacherId) { this.teacherId = teacherId; }
    public Date getClassDate() { return classDate; }
    public void setClassDate(Date classDate) { this.classDate = classDate; }
    public Time getStartTime() { return startTime; }
    public void setStartTime(Time startTime) { this.startTime = startTime; }
    public Time getEndTime() { return endTime; }
    public void setEndTime(Time endTime) { this.endTime = endTime; }
}
