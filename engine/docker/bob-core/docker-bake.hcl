variable "BASE_IMAGE" {
}

variable "IMAGE" {
  default = "kubler/bob-core"
}

variable "TAG" {
  default = "latest"
}

variable "MAINTAINER" {
  default = "berney"
}

# If default is `null`, it lets ARG default in Dockerfile be used
variable "BOB_CHOST" {
  default = null
  # glibc
  #default = "x86_64-pc-linux-gnu"
  # musl
  #default = "x86_64-gentoo-linux-musl"
}

variable "BOB_CFLAGS" {
  default = null
}
variable "BOB_CXXFLAGS" {
  default = null
}

# Only used for cross compiling
variable "BOB_BUILDER_CHOST" {
  default = null
}
variable "BOB_BUILDER_CFLAGS" {
  default = null
}
variable "BOB_BUILDER_CXXFLAGS" {
  default = null
}


group "default" {
  targets = [ "core" ]
}


target "core" {
  tags = [ "${IMAGE}:${TAG}" ]
  labels = {
    maintainer = "${MAINTAINER}"
  }
  args = {
    BASE_IMAGE = "${BASE_IMAGE}"
    BOB_CHOST = "${BOB_CHOST}"
    BOB_CFLAGS = "${BOB_CFLAGS}"
    BOB_CXXFLAGS = "${BOB_CXXFLAGS}"
    BOB_BUILDER_CHOST = "${BOB_BUILDER_CHOST}"
    BOB_BUILDER_CFLAGS = "${BOB_BUILDER_CFLAGS}"
    BOB_BUILDER_CXXFLAGS = "${BOB_BUILDER_CXXFLAGS}"
  }
}
