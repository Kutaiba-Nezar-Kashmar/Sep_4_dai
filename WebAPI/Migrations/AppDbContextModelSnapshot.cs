﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using WebAPI.Persistence;

#nullable disable

namespace WebAPI.Migrations
{
    [DbContext(typeof(AppDbContext))]
    partial class AppDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.3")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder, 1L, 1);

            modelBuilder.Entity("Domain.Actuator", b =>
                {
                    b.Property<int>("ActuatorId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("ActuatorId"), 1L, 1);

                    b.Property<string>("ClimateDeviceId")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Type")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("ActuatorId");

                    b.HasIndex("ClimateDeviceId");

                    b.ToTable("Actuator");
                });

            modelBuilder.Entity("Domain.ClimateDevice", b =>
                {
                    b.Property<string>("ClimateDeviceId")
                        .HasColumnType("nvarchar(450)");

                    b.Property<int?>("RoomId")
                        .HasColumnType("int");

                    b.Property<int?>("SettingsSettingId")
                        .HasColumnType("int");

                    b.HasKey("ClimateDeviceId");

                    b.HasIndex("RoomId");

                    b.HasIndex("SettingsSettingId");

                    b.ToTable("ClimateDevice");
                });

            modelBuilder.Entity("Domain.Measurement", b =>
                {
                    b.Property<int>("MeasurementId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("MeasurementId"), 1L, 1);

                    b.Property<string>("ClimateDeviceId")
                        .HasColumnType("nvarchar(450)");

                    b.Property<int>("Co2")
                        .HasColumnType("int");

                    b.Property<int>("Humidity")
                        .HasColumnType("int");

                    b.Property<float>("Temperature")
                        .HasColumnType("real");

                    b.Property<DateTime>("Timestamp")
                        .HasColumnType("datetime2");

                    b.HasKey("MeasurementId");

                    b.HasIndex("ClimateDeviceId");

                    b.ToTable("Measurements");
                });

            modelBuilder.Entity("Domain.Room", b =>
                {
                    b.Property<int>("RoomId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("RoomId"), 1L, 1);

                    b.Property<string>("RoomName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("SettingsSettingId")
                        .HasColumnType("int");

                    b.HasKey("RoomId");

                    b.HasIndex("SettingsSettingId");

                    b.ToTable("Rooms");
                });

            modelBuilder.Entity("Domain.Sensor", b =>
                {
                    b.Property<int>("SensorId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("SensorId"), 1L, 1);

                    b.Property<string>("ClimateDeviceId")
                        .HasColumnType("nvarchar(450)");

                    b.HasKey("SensorId");

                    b.HasIndex("ClimateDeviceId");

                    b.ToTable("Sensor");
                });

            modelBuilder.Entity("Domain.Settings", b =>
                {
                    b.Property<int>("SettingId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("SettingId"), 1L, 1);

                    b.Property<int>("Co2Threshold")
                        .HasColumnType("int");

                    b.Property<int>("HumidityThreshold")
                        .HasColumnType("int");

                    b.Property<float>("TargetTemperature")
                        .HasColumnType("real");

                    b.Property<int>("TemperatureMargin")
                        .HasColumnType("int");

                    b.HasKey("SettingId");

                    b.ToTable("Settings");
                });

            modelBuilder.Entity("Domain.User", b =>
                {
                    b.Property<int>("UserId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("UserId"), 1L, 1);

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("UserId");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("Domain.Actuator", b =>
                {
                    b.HasOne("Domain.ClimateDevice", null)
                        .WithMany("Actuators")
                        .HasForeignKey("ClimateDeviceId");
                });

            modelBuilder.Entity("Domain.ClimateDevice", b =>
                {
                    b.HasOne("Domain.Room", null)
                        .WithMany("ClimateDevices")
                        .HasForeignKey("RoomId");

                    b.HasOne("Domain.Settings", "Settings")
                        .WithMany()
                        .HasForeignKey("SettingsSettingId");

                    b.Navigation("Settings");
                });

            modelBuilder.Entity("Domain.Measurement", b =>
                {
                    b.HasOne("Domain.ClimateDevice", null)
                        .WithMany("Measurements")
                        .HasForeignKey("ClimateDeviceId");
                });

            modelBuilder.Entity("Domain.Room", b =>
                {
                    b.HasOne("Domain.Settings", "Settings")
                        .WithMany()
                        .HasForeignKey("SettingsSettingId");

                    b.Navigation("Settings");
                });

            modelBuilder.Entity("Domain.Sensor", b =>
                {
                    b.HasOne("Domain.ClimateDevice", null)
                        .WithMany("Sensors")
                        .HasForeignKey("ClimateDeviceId");
                });

            modelBuilder.Entity("Domain.ClimateDevice", b =>
                {
                    b.Navigation("Actuators");

                    b.Navigation("Measurements");

                    b.Navigation("Sensors");
                });

            modelBuilder.Entity("Domain.Room", b =>
                {
                    b.Navigation("ClimateDevices");
                });
#pragma warning restore 612, 618
        }
    }
}
