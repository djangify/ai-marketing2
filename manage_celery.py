#!/usr/bin/env python
import os
import sys
import signal
import subprocess

def start_celery():
    """Start Celery worker"""
    cmd = "celery -A ai_marketing worker -l info"
    process = subprocess.Popen(cmd.split())
    return process

def stop_celery(process):
    """Stop Celery worker gracefully"""
    process.send_signal(signal.SIGTERM)
    process.wait()

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python manage_celery.py [start|stop|restart]")
        sys.exit(1)
        
    command = sys.argv[1]
    
    if command == "start":
        process = start_celery()
        print(f"Celery worker started with PID: {process.pid}")
    else:
        print(f"Unknown command: {command}")