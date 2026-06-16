CREATE DATABASE IF NOT EXISTS funeralnet_db;

USE funeralnet_db;

CREATE TABLE users (
    user_id CHAR(36) PRIMARY KEY,

    full_name VARCHAR(150) NOT NULL,

    email VARCHAR(255)
    UNIQUE NOT NULL,

    password_hash VARCHAR(255)
    NOT NULL,

    role ENUM(
        'ADMIN',
        'OPERATOR',
        'ANALYST'
    ) DEFAULT 'OPERATOR',

    created_at TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP
);



CREATE TABLE regions (

    region_id CHAR(36)
    PRIMARY KEY,

    region_name VARCHAR(120)
    UNIQUE NOT NULL,

    created_at TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE services (

    service_id CHAR(36)
    PRIMARY KEY,

    region_id CHAR(36),

    service_name VARCHAR(150)
    NOT NULL,

    description TEXT,

    created_at TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (region_id)
    REFERENCES regions(region_id)
);



CREATE TABLE reports (

    report_id CHAR(36)
    PRIMARY KEY,

    user_id CHAR(36),

    service_id CHAR(36),

    region_id CHAR(36),

    report_title VARCHAR(255),

    status ENUM(
        'PENDING',
        'GENERATED',
        'ARCHIVED'
    ),

    created_at TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id),

    FOREIGN KEY (service_id)
    REFERENCES services(service_id),

    FOREIGN KEY (region_id)
    REFERENCES regions(region_id)
);



CREATE TABLE analytics (

    analytics_id CHAR(36)
    PRIMARY KEY,

    report_id CHAR(36),

    metric_name VARCHAR(100),

    metric_value DECIMAL(
        12,
        2
    ),

    generated_at TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (report_id)
    REFERENCES reports(report_id)
);



CREATE TABLE logs (

    log_id CHAR(36)
    PRIMARY KEY,

    user_id CHAR(36),

    action_name VARCHAR(255),

    log_level ENUM(
        'INFO',
        'WARNING',
        'ERROR'
    ),

    created_at TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);
