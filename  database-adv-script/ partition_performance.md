| Metric                    | Non-Partitioned Table | Partitioned Table       |
| ------------------------- | --------------------- | ----------------------- |
| Planning Time             | Higher                | Lower                   |
| Execution Time            | Higher                | Lower                   |
| Scanned Rows              | All rows              | Only relevant partition |
| Partition Pruning Enabled | ❌                     | ✅                       |
