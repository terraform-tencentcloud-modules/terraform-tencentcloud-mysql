variable "region" {
  default = "ap-guangzhou"
}

provider "tencentcloud" {
  region  = "ap-guangzhou"
}

module "privilege" {
  source = "../../"

  instance_id = "cdb-rslbpa09"
  account = [
    {
      account_name     = "test_account"
      account_password = "test_passwd1"
    },
    {
      account_name     = "test_account1"
      account_password = "test_passwd2"
    }
  ]
  mysql_privilege = [
    {
      account_name = "test_account"
      global       = ["SELECT"]
      database = [
        {
          database_name = "my_database"
          privileges    = ["INSERT", "UPDATE"]
        }
      ]
      table = [
        {
          database_name = "my_database"
          table_name    = "my_table"
          privileges    = ["DELETE"]
        }
      ]
      column = [
        {
          database_name = "my_database"
          table_name    = "my_table"
          column_name   = "test_column"
          privileges    = ["UPDATE"]
        }
      ]

    }
  ]
}
