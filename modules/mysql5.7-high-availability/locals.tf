locals {
  region            = var.region != "" ? var.region : null
  availability_zone = var.availability_zone != "" ? var.availability_zone : "ap-guangzhou-2"
  mem_size          = var.mem_size != 0 ? var.mem_size : 1000
  volume_size       = var.volume_size != 0 ? var.volume_size : 200
  readonly_tags     = [{ "type" : "readonly" }]
}

