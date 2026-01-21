"""
025 - Mock Data Generator for Manufacturing Digital Twin (Part 2)
=================================================================
Generates realistic mock data for the manufacturing schema to populate
the SQLMesh staging models. Creates DuckDB-compatible seed data.

Usage:
    python 025_Entry_Point_DDL_to_SQLMesh_Part2.py [--rows N] [--output-dir PATH] [--preview]

Features:
    - Uses Faker for realistic synthetic data generation
    - Generates realistic manufacturing metrics (OEE, MTBF, defect rates)
    - Maintains referential integrity across tables
    - Creates time-series data with configurable date ranges
    - Outputs CSV seeds for SQLMesh SEED models

Part II Enhancements:
    - Faker-powered company names, contacts, addresses
    - Manufacturing-specific Faker providers
    - Complete coverage for all 26 staging tables
"""

import os
import csv
import random
import argparse
from pathlib import Path
from datetime import datetime, timedelta
from dataclasses import dataclass
from typing import Optional
from faker import Faker


# Configuration
DEFAULT_START_DATE = datetime(2024, 1, 1)
DEFAULT_END_DATE = datetime(2024, 12, 31)
DEFAULT_ROWS_PER_TABLE = 100


class MockConfig:
    """Configuration for mock data generation."""
    def __init__(
        self,
        start_date: datetime = DEFAULT_START_DATE,
        end_date: datetime = DEFAULT_END_DATE,
        rows_per_table: int = DEFAULT_ROWS_PER_TABLE,
        output_dir: str = "Utilities/SQLMesh/seeds",
        seed: int = 42
    ):
        self.start_date = start_date
        self.end_date = end_date
        self.rows_per_table = rows_per_table
        self.output_dir = output_dir
        self.seed = seed
        self.fake = Faker()
        Faker.seed(seed)
        random.seed(seed)


# Realistic manufacturing data pools
SUPPLIERS = [
    ("Precision Parts Inc.", "precision@parts.com", "555-0101", "Detroit, MI"),
    ("Global Components Ltd.", "sales@globalcomp.com", "555-0102", "Shanghai, China"),
    ("AeroTech Materials", "info@aerotech.com", "555-0103", "Seattle, WA"),
    ("Quality Fasteners Co.", "qfc@fasteners.com", "555-0104", "Cleveland, OH"),
    ("Advanced Alloys LLC", "contact@advalloys.com", "555-0105", "Pittsburgh, PA"),
    ("Midwest Manufacturing", "orders@midwestmfg.com", "555-0106", "Chicago, IL"),
    ("Pacific Precision", "sales@pacificprec.com", "555-0107", "Los Angeles, CA"),
    ("Eastern Electronics", "info@easternelec.com", "555-0108", "Boston, MA"),
]

PRODUCT_LINES = [
    ("Turbine Blades", "Aerospace", 5000, 2500.00, 0.35),
    ("Landing Gear", "Aerospace", 200, 45000.00, 0.28),
    ("Hydraulic Actuators", "Industrial", 1500, 850.00, 0.32),
    ("Control Valves", "Industrial", 3000, 420.00, 0.40),
    ("Precision Bearings", "Automotive", 10000, 125.00, 0.45),
    ("Sensor Assemblies", "Electronics", 8000, 75.00, 0.38),
    ("Composite Panels", "Aerospace", 800, 3200.00, 0.30),
    ("Engine Mounts", "Automotive", 4000, 280.00, 0.35),
]

PRODUCTION_LINES = [
    ("Line A - Main Assembly", "Building 1", "Assembly", 500),
    ("Line B - Precision Machining", "Building 1", "Machining", 200),
    ("Line C - Heat Treatment", "Building 2", "Processing", 300),
    ("Line D - Quality Inspection", "Building 2", "Inspection", 400),
    ("Line E - Packaging", "Building 3", "Packaging", 600),
    ("Line F - CNC Center", "Building 1", "Machining", 150),
]

EQUIPMENT_TYPES = [
    "CNC Lathe", "Milling Machine", "Robotic Arm", "Conveyor System",
    "Hydraulic Press", "Laser Cutter", "Heat Treatment Oven", "CMM",
    "Assembly Robot", "Packaging Machine", "Quality Scanner", "Welding Station"
]

DEFECT_TYPES = [
    "Surface Scratch", "Dimensional Out-of-Spec", "Material Contamination",
    "Weld Defect", "Missing Component", "Incorrect Assembly", "Coating Failure",
    "Stress Crack", "Porosity", "Thread Damage"
]

FAILURE_MODES = [
    "Bearing Wear", "Motor Burnout", "Sensor Malfunction", "Hydraulic Leak",
    "Belt Snap", "Controller Failure", "Overheating", "Vibration Damage",
    "Electrical Short", "Calibration Drift"
]

DOWNTIME_CATEGORIES = [
    "Planned Maintenance", "Unplanned Breakdown", "Material Shortage",
    "Quality Hold", "Changeover", "Operator Unavailable", "Power Outage"
]

SEVERITY_LEVELS = ["Critical", "Major", "Minor"]
STATUS_OPTIONS = ["Open", "In Progress", "Resolved", "Closed"]
SHIFTS = ["Day", "Swing", "Night"]


def random_date(start: datetime, end: datetime) -> datetime:
    """Generate a random datetime between start and end."""
    delta = end - start
    random_days = random.randint(0, delta.days)
    random_seconds = random.randint(0, 86400)
    return start + timedelta(days=random_days, seconds=random_seconds)


def random_date_only(start: datetime, end: datetime) -> str:
    """Generate a random date string."""
    return random_date(start, end).strftime("%Y-%m-%d")


def random_datetime(start: datetime, end: datetime) -> str:
    """Generate a random datetime string."""
    return random_date(start, end).strftime("%Y-%m-%d %H:%M:%S")


# ... (rest of file unchanged - already copied earlier)