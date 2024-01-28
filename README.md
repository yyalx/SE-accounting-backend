# SE-accounting-backend

## figma link
> https://www.figma.com/file/jjaCRjO558NVslEqXHskob/SE-accounting?type=design&node-id=0%3A1&mode=design&t=Bh6ningdyPB708Tl-1



## startup
1. install sql on local: 
    ```shell
    sudo docker run --cap-add SYS_PTRACE -e 'ACCEPT_EULA=1' -e 'MSSQL_SA_PASSWORD=Admin123' -p 1433:1433 --name azuresqledge -d mcr.microsoft.com/azure-sql-edge
    ```
2. create database: 
    ```sql
    create database sa_accounting
    ```
3. set environment variables
    > environment=dev

4. now you are ready to run