// generated from
// rosidl_typesupport_coredx_cpp/resource/msg__rosidl_typesupport_coredx_cpp.hpp.em
// generated code does not contain a copyright notice

@#######################################################################
@# EmPy template for generating
@# <msg>__rosidl_typesupport_coredx_cpp.hpp files
@#
@# Context:
@#  - spec (rosidl_parser.MessageSpecification)
@#    Parsed specification of the .msg file
@#  - subfolder (string)
@#    The subfolder / subnamespace of the message
@#    Either 'msg' or 'srv'
@#  - get_header_filename_from_msg_name (function)
@#######################################################################
@
@{
header_guard_parts = [
    spec.base_type.pkg_name, subfolder,
    get_header_filename_from_msg_name(spec.base_type.type) + '__rosidl_typesupport_coredx_cpp_hpp']
header_guard_variable = '__'.join([x.upper() for x in header_guard_parts]) + '_'
}@
#ifndef @(header_guard_variable)
#define @(header_guard_variable)

#include "rosidl_generator_c/message_type_support_struct.h"
#include "rosidl_typesupport_interface/macros.h"

#include "@(spec.base_type.pkg_name)/msg/rosidl_typesupport_coredx_cpp__visibility_control.h"

#include "@(spec.base_type.pkg_name)/@(subfolder)/@(get_header_filename_from_msg_name(spec.base_type.type))__struct.hpp"
#include "@(spec.base_type.pkg_name)/@(subfolder)/dds_coredx/@(spec.base_type.type)_TypeSupport.hh"

namespace @(spec.base_type.pkg_name)
{

namespace @(subfolder)
{

namespace typesupport_coredx_cpp
{

bool
register_type__@(spec.base_type.type)(
  DDS::DomainParticipant * participant,
  const char * type_name);

bool
ROSIDL_TYPESUPPORT_COREDX_CPP_PUBLIC_@(spec.base_type.pkg_name)
convert_ros_message_to_dds(
  const @(spec.base_type.pkg_name)::@(subfolder)::@(spec.base_type.type) & ros_message,
  @(spec.base_type.pkg_name)::@(subfolder)::dds_::@(spec.base_type.type)_ & dds_message);

bool
publish__@(spec.base_type.type)(
  DDS::DataWriter * topic_writer,
  const void * untyped_ros_message);

bool
ROSIDL_TYPESUPPORT_COREDX_CPP_PUBLIC_@(spec.base_type.pkg_name)
convert_dds_message_to_ros(
  const @(spec.base_type.pkg_name)::@(subfolder)::dds_::@(spec.base_type.type)_ & dds_message,
  @(spec.base_type.pkg_name)::@(subfolder)::@(spec.base_type.type) & ros_message);

bool
take__@(spec.base_type.type)(
  DDS::DataReader * topic_reader,
  bool ignore_local_publications,
  void * untyped_ros_message,
  bool * taken);

}  // namespace typesupport_coredx_cpp

}  // namespace @(subfolder)

}  // namespace @(spec.base_type.pkg_name)

#ifdef __cplusplus
extern "C"
{
#endif

ROSIDL_TYPESUPPORT_COREDX_CPP_PUBLIC_@(spec.base_type.pkg_name)
const rosidl_message_type_support_t *
  ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_coredx_cpp, @(spec.base_type.pkg_name), @(subfolder), @(spec.base_type.type))();

#ifdef __cplusplus
}
#endif

#endif  // @(header_guard_variable)
