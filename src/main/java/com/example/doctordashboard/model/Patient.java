package com.example.doctordashboard.model;

import com.example.doctordashboard.enums.AppointmentStatus;
import com.example.doctordashboard.enums.SurgeryStatus;

public class Patient {

    private Long id;
    private String name;
    private String lastname;
    private int mobileNumber;
    private String surgeryType;
    private String description;
    private String address;
    private int age;
    private String assignedDoctor;
    private SurgeryStatus surgerySurgeoryStatus;
    private AppointmentStatus status;
    private String createBy;
    private Long createdTime;
    private String modifiedBy;
    private Long modifiedTime;
}
