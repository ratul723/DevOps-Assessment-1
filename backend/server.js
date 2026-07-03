import dotenv from "dotenv";
dotenv.config();

import express from "express";
import cors from "cors";
import pg from "pg";

const { Pool } = pg;

const app = express();
const PORT = process.env.PORT || 8080;

app.use(cors());
app.use(express.json());

const pool = new Pool({
  host: process.env.DB_HOST,
  port: Number(process.env.DB_PORT) || 5432,
  user: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
  database: process.env.POSTGRES_DB,
});

// Root endpoint
app.get("/", (req, res) => {
  res.send("Application is running");
});

// Health endpoint
app.get("/health", async (req, res) => {
  try {
    // Silently check that the private DB is reachable
    await pool.query("SELECT 1;");

    // Exact response structure required by your task
    res.json({
      status: "ok",
    });
  } catch (error) {
    console.error("DATABASE CONNECTIVITY FAILED DEEP REASON:", error.message);
    res.status(500).json({
      status: "error",
      message: "Database connection failed",
      debug: error.message || error,
    });
  }
});

// Graceful container termination handler
process.on("SIGTERM", async () => {
  await pool.end();
  process.exit(0);
});

app.listen(PORT, () => {
  console.log(`Backend running on port ${PORT}`);
});
