from sqlalchemy import create_engine
import os
"""
import cx_Oracle
cx_Oracle.init_oracle_client(lib_dir=LD_LIBRARY_PATH, config_dir="")

# else assume system library search path includes Oracle Client libraries
# On Linux, use ldconfig or set LD_LIBRARY_PATH, as described in installation documentation.
"""
LD_LIBRARY_PATH = os.getenv("LD_LIBRARY_PATH")
ORACLE_USERNAME = os.getenv("ORACLE_USERNAME")
ORACLE_PASSWORD = os.getenv("ORACLE_PASSWORD")
ORACLE_DSN = os.getenv("ORACLE_DSN")


engine = create_engine(
    f"oracle://{ORACLE_USERNAME}:{ORACLE_PASSWORD}@{ORACLE_DSN}/?encoding=UTF-8&nencoding=UTF-8",
    max_identifier_length=128,
)

with engine.connect() as conn:
    print(conn.scalar("SELECT USERNAME FROM ALL_USERS ORDER BY USERNAME"))
