CREATE ROLE 'admin_role';
CREATE ROLE 'hr_role';
CREATE ROLE 'vienchuc_role';
CREATE ROLE 'viewer_role';

GRANT ALL PRIVILEGES ON *.* TO 'admin_role' WITH GRANT OPTION;
