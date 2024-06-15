new (require("sqlite3").verbose()).Database("database.db").run(`
CREATE TABLE \`users\` (
	\`name\` VARCHAR(30) NOT NULL,
	\`phone\` VARCHAR(20) NOT NULL,
	\`email\` VARCHAR(100) NOT NULL,
	\`password\` VARCHAR(200) NOT NULL,
	UNIQUE(\`phone\`),
	UNIQUE(\`email\`)
);
`);