# Checkpoint

| Step | Status |
|---|---|
| 1 — Design | Complete |
| 2 — Build and database configuration | Complete |
| 3 — DTO | Complete |
| 5 — Repository, controller, application | Complete |
| 6 — Seed data | Not applicable (not requested) |
| 7 — Start script | Complete |
| 9 — Documentation | Complete |
| 10 — Build check | Complete — Apache Ant 1.10.15 and Java 21 compiled successfully |
| 11 — Curl boot/API verification | Complete — start script booted against PostgreSQL and live POST returned HTTP 201 |
| 14 — Fix loop | Complete — repaired Ivy namespace/task registration and added portable Ant bootstrap to start script |
| 15/15.5 — Reports | Complete — artifacts contain the observed live HTTP result |
| 16 — Final summary | Complete |

## Verification record
- `ant clean compile` completed successfully with Apache Ant 1.10.15 and OpenJDK 21.0.12.1.
- Fixed the Ant/Ivy build configuration by declaring the Ivy XML namespace and associating its task definition with that namespace.
- `start.sh` now uses system Ant when available and otherwise bootstraps Apache Ant 1.10.15 using curl or wget; it invokes the build file by absolute script-relative path.
- Booted `start.sh` with `DATABASE_URL=jdbc:postgresql://127.0.0.1:5432/credentials_db`, a dedicated PostgreSQL user, and `SERVER_PORT=8081`. Spring Boot connected to PostgreSQL 17.11 and started Tomcat on port 8081.
- Live `POST /credentials` with JSON `id` and `password` returned HTTP 201. The workbook has the real request result as a PASS row.
- Generated reports: `tests-artifacts/api_test_report.xlsx`, `tests-artifacts/project_report.docx`.

## Decisions
- Java 21 / Spring Boot 3.4.0, Ant 1.10.15 with Ivy; PostgreSQL through environment-backed Spring configuration.
- One `credential` resource group owns the `credentials` table, DTO, repository, and public `POST /credentials` endpoint.
- Application port defaults to 8081 (configured with `SERVER_PORT` override) to protect port 8080.
- No authentication, messaging, Docker, CI, or read endpoint.
- Verification is Ant compilation plus curl smoke testing against a temporary local H2-compatible profile substitute is not allowed; actual PostgreSQL configuration is retained.
