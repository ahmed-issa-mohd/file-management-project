﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

public partial class FileSystemEntities : DbContext
{
    public FileSystemEntities()
        : base("name=FileSystemEntities")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }

    public virtual DbSet<Account> Account { get; set; }
    public virtual DbSet<Courses> Courses { get; set; }
    public virtual DbSet<Files> Files { get; set; }
    public virtual DbSet<FileWho> FileWho { get; set; }
    public virtual DbSet<Major> Major { get; set; }
    public virtual DbSet<Section> Section { get; set; }
    public virtual DbSet<Student> Student { get; set; }
    public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
    public virtual DbSet<Trainer> Trainer { get; set; }
    public virtual DbSet<StudentSection> StudentSection { get; set; }
}