FuneralNet AWS Architecture

Users
   │
   ▼
Public Internet
   │
   ▼
EC2 (Ubuntu)
│
├── Nginx (Port 80)
│
├── Docker Compose
│     ├── Frontend Container (8090)
│     ├── Backend Container (5050)
│     └── MySQL Container (3307)
│
├── Monitoring
│     ├── htop
│     └── docker stats
│
├── Backup
│     └── mysqldump → backups/db_backup.sql
│
└── GitHub Repository
      └── Deployment Source
