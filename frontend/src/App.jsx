import { useEffect, useState } from "react";
import "./App.css";

function App() {
  const [message, setMessage] = useState("Loading...");
  const [health, setHealth] = useState("Loading...");

  useEffect(() => {
    const controller = new AbortController();
    const { signal } = controller;

    // Always use the same-origin API gateway path. In dev, Vite proxy will route
    // /api to the local backend. In Kubernetes, nginx/ingress will route /api to the
    // backend service.
    const apiBaseUrl = "/api";

    const loadDashboardData = async () => {
      try {
        const textResponse = await fetch(`${apiBaseUrl}/`, { signal });
        if (textResponse.ok) {
          const textData = await textResponse.text();
          setMessage(textData);
        } else {
          setMessage("Backend error response");
        }

        // 2. Fetch from "/health" using the dynamic Kubernetes variable
        const jsonResponse = await fetch(`${apiBaseUrl}/health`, {
          signal,
        });
        if (jsonResponse.ok) {
          const jsonData = await jsonResponse.json();
          setHealth(jsonData.status === "ok" ? "Healthy (OK)" : "Unhealthy");
        } else {
          setHealth("Unhealthy response");
        }
      } catch (error) {
        if (error.name !== "AbortError") {
          console.error(
            "Frontend fetch sequence encountered a network crash:",
            error,
          );
          setMessage("Backend unavailable");
          setHealth("Unavailable");
        }
      }
    };

    loadDashboardData();

    return () => {
      controller.abort();
    };
  }, []);

  return (
    <div className="container">
      <h1>DevOps Assessment</h1>

      <div className="card">
        <h2>Backend Status</h2>
        <p
          style={{
            fontWeight: "bold",
            color: message.includes("unavailable") ? "red" : "green",
          }}
        >
          {message}
        </p>
      </div>

      <div className="card">
        <h2>Health Status</h2>
        <p
          style={{
            fontWeight: "bold",
            color: health.includes("Unavailable") ? "red" : "green",
          }}
        >
          {health}
        </p>
      </div>
    </div>
  );
}

export default App;
