// Auto-generated. Do not edit!

// (in-package yolov5_ros_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Silos {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.a = null;
      this.b = null;
      this.c = null;
      this.d = null;
      this.e = null;
    }
    else {
      if (initObj.hasOwnProperty('a')) {
        this.a = initObj.a
      }
      else {
        this.a = '';
      }
      if (initObj.hasOwnProperty('b')) {
        this.b = initObj.b
      }
      else {
        this.b = '';
      }
      if (initObj.hasOwnProperty('c')) {
        this.c = initObj.c
      }
      else {
        this.c = '';
      }
      if (initObj.hasOwnProperty('d')) {
        this.d = initObj.d
      }
      else {
        this.d = '';
      }
      if (initObj.hasOwnProperty('e')) {
        this.e = initObj.e
      }
      else {
        this.e = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Silos
    // Serialize message field [a]
    bufferOffset = _serializer.string(obj.a, buffer, bufferOffset);
    // Serialize message field [b]
    bufferOffset = _serializer.string(obj.b, buffer, bufferOffset);
    // Serialize message field [c]
    bufferOffset = _serializer.string(obj.c, buffer, bufferOffset);
    // Serialize message field [d]
    bufferOffset = _serializer.string(obj.d, buffer, bufferOffset);
    // Serialize message field [e]
    bufferOffset = _serializer.string(obj.e, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Silos
    let len;
    let data = new Silos(null);
    // Deserialize message field [a]
    data.a = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [b]
    data.b = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [c]
    data.c = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [d]
    data.d = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [e]
    data.e = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.a);
    length += _getByteLength(object.b);
    length += _getByteLength(object.c);
    length += _getByteLength(object.d);
    length += _getByteLength(object.e);
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yolov5_ros_msgs/Silos';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e0d20c93acc3618dfe0f15b8b4227da9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string a
    string b
    string c
    string d
    string e
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Silos(null);
    if (msg.a !== undefined) {
      resolved.a = msg.a;
    }
    else {
      resolved.a = ''
    }

    if (msg.b !== undefined) {
      resolved.b = msg.b;
    }
    else {
      resolved.b = ''
    }

    if (msg.c !== undefined) {
      resolved.c = msg.c;
    }
    else {
      resolved.c = ''
    }

    if (msg.d !== undefined) {
      resolved.d = msg.d;
    }
    else {
      resolved.d = ''
    }

    if (msg.e !== undefined) {
      resolved.e = msg.e;
    }
    else {
      resolved.e = ''
    }

    return resolved;
    }
};

module.exports = Silos;
