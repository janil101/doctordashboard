package com.example.doctordashboard.model;

import com.example.doctordashboard.enums.Designation;
import com.example.doctordashboard.enums.SurgeryStatus;

public class Doctor {

    private Long id;
    private String name;
    private String lastname;
    private int mobileNumber;
    private Designation designation;
    private String specialization;
    private int age;
    private SurgeryStatus surgeryStatus;
    private int experience;
    private String createBy;
    private Long createdTime;
    private String modifiedBy;
    private Long modifiedTime;

}
