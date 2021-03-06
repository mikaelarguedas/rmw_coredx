// generated from rosidl_typesupport_coredx_cpp/resource/msg__type_support.cpp.em
// generated code does not contain a copyright notice

@#######################################################################
@# EmPy template for generating <msg>__type_support.cpp files
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
#include "@(spec.base_type.pkg_name)/@(subfolder)/@(get_header_filename_from_msg_name(spec.base_type.type))__rosidl_typesupport_coredx_cpp.hpp"

#include <limits>
#include <stdexcept>

#include "rosidl_typesupport_cpp/message_type_support.hpp"

#include "rosidl_typesupport_coredx_cpp/identifier.hpp"
#include "rosidl_typesupport_coredx_cpp/message_type_support.h"
#include "rosidl_typesupport_coredx_cpp/message_type_support_decl.hpp"

// forward declaration of message dependencies and their conversion functions
@[for field in spec.fields]@
@[  if not field.type.is_primitive_type()]@
namespace @(field.type.pkg_name)
{
namespace msg
{
namespace dds_
{
class @(field.type.type)_;
}  // namespace dds_
namespace typesupport_coredx_cpp
{
bool convert_ros_message_to_dds(
  const @(field.type.pkg_name)::msg::@(field.type.type) &,
  @(field.type.pkg_name)::msg::dds_::@(field.type.type)_ &);
bool convert_dds_message_to_ros(
  const @(field.type.pkg_name)::msg::dds_::@(field.type.type)_ &,
  @(field.type.pkg_name)::msg::@(field.type.type) &);
}  // namespace typesupport_coredx_cpp
}  // namespace msg
}  // namespace @(field.type.pkg_name)

@[  end if]@
@[end for]@

namespace @(spec.base_type.pkg_name)
{

namespace @(subfolder)
{

namespace typesupport_coredx_cpp
{

bool
register_type__@(spec.base_type.type)(
  void * untyped_participant,
  const char * type_name)
{
  DDS::DomainParticipant * participant = static_cast<DDS::DomainParticipant *>(untyped_participant);
  DDS::ReturnCode_t status =
    @(spec.base_type.pkg_name)::@(subfolder)::dds_::@(spec.base_type.type)_TypeSupport::register_type(participant, type_name);

  return status == DDS::RETCODE_OK;
}

bool
convert_ros_message_to_dds(
  const @(spec.base_type.pkg_name)::@(subfolder)::@(spec.base_type.type) & ros_message,
  @(spec.base_type.pkg_name)::@(subfolder)::dds_::@(spec.base_type.type)_ & dds_message)
{
@[if not spec.fields]@
  (void)ros_message;
  (void)dds_message;
@[end if]@
@[for field in spec.fields]@
  // field.name @(field.name)
@[  if field.type.is_array]@
  {
@[    if field.type.array_size and not field.type.is_upper_bound]@
    size_t size = @(field.type.array_size);
@[    else]@
    size_t size = ros_message.@(field.name).size();
    if (size > (std::numeric_limits<int32_t>::max)()) {
      throw std::runtime_error("array size exceeds maximum DDS sequence size");
    }
@[      if field.type.is_upper_bound]@
    if (size > @(field.type.array_size)) {
      throw std::runtime_error("array size exceeds upper bound");
    }
@[      end if]@
    uint32_t length = static_cast<int32_t>(size);
    if (!dds_message.@(field.name)_.resize(length)) {
      throw std::runtime_error("failed to set length of sequence");
    }
@[    end if]@
    for (size_t i = 0; i < size; i++) {
@[    if field.type.type == 'string']@
      DDS::String_free(dds_message.@(field.name)_[static_cast<int32_t>(i)]);
      dds_message.@(field.name)_[static_cast<int32_t>(i)] =
        DDS::String_dup(ros_message.@(field.name)[i].c_str());
@[    elif field.type.is_primitive_type()]@
      dds_message.@(field.name)_[static_cast<int32_t>(i)] =
        ros_message.@(field.name)[i];
@[    else]@
      if (
        !@(field.type.pkg_name)::msg::typesupport_coredx_cpp::convert_ros_message_to_dds(
          ros_message.@(field.name)[i],
          dds_message.@(field.name)_[static_cast<int32_t>(i)]))
      {
        return false;
      }
@[    end if]@
    }
  }
@[  elif field.type.type == 'string']@
  DDS::String_free(dds_message.@(field.name)_);
  dds_message.@(field.name)_ =
    DDS::String_dup(ros_message.@(field.name).c_str());
@[  elif field.type.is_primitive_type()]@
  dds_message.@(field.name)_ =
    ros_message.@(field.name);
@[  else]@
  if (
    !@(field.type.pkg_name)::msg::typesupport_coredx_cpp::convert_ros_message_to_dds(
      ros_message.@(field.name),
      dds_message.@(field.name)_))
  {
    return false;
  }
@[  end if]@

@[end for]@
  return true;
}

bool
publish__@(spec.base_type.type)(
  void * untyped_topic_writer,
  const void * untyped_ros_message)
{
  DDS::DataWriter * topic_writer = static_cast<DDS::DataWriter *>(untyped_topic_writer);

  const @(spec.base_type.pkg_name)::@(subfolder)::@(spec.base_type.type) & ros_message =
    *(const @(spec.base_type.pkg_name)::@(subfolder)::@(spec.base_type.type) *)untyped_ros_message;
  @(spec.base_type.pkg_name)::@(subfolder)::dds_::@(spec.base_type.type)_ * dds_message =
    new @(spec.base_type.pkg_name)::@(subfolder)::dds_::@(spec.base_type.type)_;
  if (!dds_message) {
    return false;
  }

  bool success = convert_ros_message_to_dds(ros_message, *dds_message);
  if (success) {
    @(spec.base_type.pkg_name)::@(subfolder)::dds_::@(spec.base_type.type)_DataWriter * data_writer =
      @(spec.base_type.pkg_name)::@(subfolder)::dds_::@(spec.base_type.type)_DataWriter::narrow(topic_writer);
    DDS::ReturnCode_t status = data_writer->write(dds_message, DDS::HANDLE_NIL);
    success = status == DDS::RETCODE_OK;
  }
  
  delete dds_message;
  return success;
}

bool
convert_dds_message_to_ros(
  const @(spec.base_type.pkg_name)::@(subfolder)::dds_::@(spec.base_type.type)_ & dds_message,
  @(spec.base_type.pkg_name)::@(subfolder)::@(spec.base_type.type) & ros_message)
{
@[if not spec.fields]@
  (void)ros_message;
  (void)dds_message;
@[end if]@
@[for field in spec.fields]@
  // field.name @(field.name)
@[  if field.type.is_array]@
  {
@[    if field.type.array_size and not field.type.is_upper_bound]@
    size_t size = @(field.type.array_size);
@[    else]@
    size_t size = dds_message.@(field.name)_.length();
    ros_message.@(field.name).resize(size);
@[    end if]@
    for (size_t i = 0; i < size; i++) {
@[    if field.type.is_primitive_type()]@
      ros_message.@(field.name)[i] =
        dds_message.@(field.name)_[static_cast<int32_t>(i)]@(' != 0' if field.type.type == 'bool' else '');
@[    else]@
      if (
        !@(field.type.pkg_name)::msg::typesupport_coredx_cpp::convert_dds_message_to_ros(
          dds_message.@(field.name)_[static_cast<int32_t>(i)],
          ros_message.@(field.name)[i]))
      {
        return false;
      }
@[    end if]@
    }
  }
@[  elif field.type.is_primitive_type()]@
  ros_message.@(field.name) =
    dds_message.@(field.name)_@(' != 0' if field.type.type == 'bool' else '');
@[  else]@
  if (
    !@(field.type.pkg_name)::msg::typesupport_coredx_cpp::convert_dds_message_to_ros(
      dds_message.@(field.name)_,
      ros_message.@(field.name)))
  {
    return false;
  }
@[  end if]@

@[end for]@
  return true;
}

bool
take__@(spec.base_type.type)(
  void * untyped_topic_reader,
  bool ignore_local_publications,
  void * untyped_ros_message,
  bool * taken,
  void * sending_publication_handle)
{
  if (!untyped_topic_reader) {
    throw std::runtime_error("topic reader handle is null");
  }
  if (!untyped_ros_message) {
    throw std::runtime_error("ros message handle is null");
  }
  if (!taken) {
    throw std::runtime_error("taken handle is null");
  }

  DDS::DataReader * topic_reader = static_cast<DDS::DataReader *>(untyped_topic_reader);

  @(spec.base_type.pkg_name)::@(subfolder)::dds_::@(spec.base_type.type)_DataReader * data_reader =
    @(spec.base_type.pkg_name)::@(subfolder)::dds_::@(spec.base_type.type)_DataReader::narrow(topic_reader);

  @(spec.base_type.pkg_name)::@(subfolder)::dds_::@(spec.base_type.type)_PtrSeq dds_messages;
  DDS::SampleInfoSeq sample_infos;
  DDS::ReturnCode_t status = data_reader->take(
    &dds_messages,
    &sample_infos,
    1,
    DDS::ANY_SAMPLE_STATE,
    DDS::ANY_VIEW_STATE,
    DDS::ANY_INSTANCE_STATE);
  if (status == DDS::RETCODE_NO_DATA) {
    *taken = false;
    return true;
  }
  if (status != DDS::RETCODE_OK) {
    fprintf(stderr, "take failed with status = %s\n", DDS_error(status));
    return false;
  }

  bool ignore_sample = false;
  DDS::SampleInfo * sample_info = sample_infos[0];
  if (!sample_info->valid_data) {
    // skip sample without data
    ignore_sample = true;
  } else if (ignore_local_publications) {
    // compare the lower 12 octets of the guids from the sender and this receiver
    // if they are equal the sample has been sent from this process and should be ignored
    void * pub_key = DDS_InstanceHandle_get_key(sample_info->publication_handle);
    void * sub_key = DDS_InstanceHandle_get_key(topic_reader->get_instance_handle());
    if (pub_key && sub_key)
      {
        if (memcmp(pub_key, sub_key, 12) == 0) /* belong to same DomainParticipant */
          ignore_sample = true;
        else
          ignore_sample = false;
      }
  }
  
  if (sample_info->valid_data && sending_publication_handle) {
    *static_cast<DDS::InstanceHandle_t *>(sending_publication_handle) =
      sample_info->publication_handle;
  }

  bool success = true;
  if (!ignore_sample) {
    @(spec.base_type.pkg_name)::@(subfolder)::@(spec.base_type.type) & ros_message =
      *(@(spec.base_type.pkg_name)::@(subfolder)::@(spec.base_type.type) *)untyped_ros_message;
    success = convert_dds_message_to_ros(*(dds_messages[0]), ros_message);
    if (success) {
      *taken = true;
    }
  } else {
    *taken = false;
  }
  data_reader->return_loan(&dds_messages, &sample_infos);

  return success;
}

static message_type_support_callbacks_t callbacks = {
  "@(spec.base_type.pkg_name)",
  "@(spec.base_type.type)",
  &register_type__@(spec.base_type.type),
  &publish__@(spec.base_type.type),
  &take__@(spec.base_type.type),
  nullptr,
  nullptr
};

static rosidl_message_type_support_t handle = {
  rosidl_typesupport_coredx_cpp::typesupport_coredx_identifier,
  &callbacks,
  get_message_typesupport_handle_function,
};

}  // namespace typesupport_coredx_cpp

}  // namespace @(subfolder)

}  // namespace @(spec.base_type.pkg_name)

namespace rosidl_typesupport_coredx_cpp
{

template<>
ROSIDL_TYPESUPPORT_COREDX_CPP_EXPORT_@(spec.base_type.pkg_name)
const rosidl_message_type_support_t *
get_message_type_support_handle<@(spec.base_type.pkg_name)::@(subfolder)::@(spec.base_type.type)>()
{
  return &@(spec.base_type.pkg_name)::@(subfolder)::typesupport_coredx_cpp::handle;
}

}  // namespace rosidl_typesupport_coredx_cpp

#ifdef __cplusplus
extern "C"
{
#endif

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_coredx_cpp, @(spec.base_type.pkg_name), @(subfolder), @(spec.base_type.type))() {
  return &@(spec.base_type.pkg_name)::@(subfolder)::typesupport_coredx_cpp::handle;
}

#ifdef __cplusplus
}
#endif
