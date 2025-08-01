# Troubleshooting

## Jupyter port 8888 conflicts and stale kernel errors after container restart

**Issue:**  
- `docker-compose up` fails because port `8888` is already in use.  
- Logs show warnings like:  
  ```
  Kernel does not exist: <kernel-id>
  ```

**Cause:**  
Browser tabs or VS Code Jupyter kernels remain connected to the old Jupyter server session, preventing the port from releasing and causing kernel session mismatches.

**Fix:**  
- Close all browser tabs (Jupyter) or VS Code notebooks connected to `http://localhost:8888`.
- If needed, restart Docker Desktop, your browser, or VS Code to clear stale connections.  
- Retry `docker-compose up` and reopen notebooks to create fresh kernels.
