## 🔢 PR
https://github.com/PulseQAQA/PulseQA/pull/88

---

## 🔗 Related Jira Tickets  
Link

---

## ℹ️ Info  
**Hardcoded Secrets & Manual Deployment Automation**

### 🔐 Secrets Management Improvement
- Identify and eliminate **hardcoded secrets** (API keys, DB credentials, tokens) from Kubernetes configurations.  
- Migrate secrets to **GCP Secret Manager** for centralized management.  
- Modify Kubernetes workloads to **dynamically fetch secrets** at runtime.  
- Apply **RBAC policies** to restrict access to secrets.  
- Implement **automatic secret rotation** to reduce the lifetime of credentials.

### ⚙️ Deployment Automation
- Build a **Bash script** to automate new client environment provisioning.  
- Ensure script includes:
  - Namespace creation  
  - Kafka topic/config setup  
  - Dynamic configuration generation  
- **Document** the process to support team-wide adoption and consistency.  

---

## 🛠️ Test Steps  

| Step No. | Action                  | Data                | Expected Result |
|----------|-------------------------|---------------------|-----------------|
| 1        | Connect to the TimescaleDB instance and retrieve all financial data records. | Table: `financial_data`, Field: `value` | All financial records are retrieved successfully. |
| 2        | Filter out null, non-numeric, or invalid values from the dataset. | Filtered dataset of valid `value` entries | Cleaned dataset is prepared for analysis. |
| 3        | Execute SQL to calculate the average using `AVG(value)`. | Filtered dataset | Average value is computed without errors. |
| 4        | Compare the result to an expected business-defined threshold range. | Expected average range (e.g., €5,000–€25,000) | Calculated average falls within the expected range. |
| 5        | Log and report the result. Flag if outside acceptable bounds. | Final computed average | Results are documented; anomalies are escalated. |

---

## 🖥️ Test Environment  

- **Platform:** PulseQA | Mobile 3.38
- **Deployment Mode:** Allure

---

## ✅ Test Execution Status

- [ ] Passed ✅  
- [ ] Failed ❌  
- [ ] Blocked ⛔  
- [ ] Not Run 🔄  

---

## 📸 Screenshot / Video (If Applicable)

Attach screenshots, logs, or videos showing the result of your change.

---

## ⚠️ Impact Analysis

**Affected Features:**
- Test Automation Infrastructure  
- TimescaleDB Instance Management  
- Runtime Configuration Switching  

**Potential Risks:**
- Test DB not being created or cleaned up properly  
- Runtime using incorrect DB context during test execution  
- Resource leaks or stale data from previous test sessions  

---

## 📌 Additional Notes

- Ensure test DB names are unique to avoid conflicts in parallel execution environments.  
- Consider using UUIDs or timestamps in DB names for dynamic provisioning.  
- Integrate this flow into automated test pipelines to support isolated, repeatable test runs.  
