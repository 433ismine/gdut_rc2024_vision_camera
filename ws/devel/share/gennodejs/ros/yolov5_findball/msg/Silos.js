// Auto-generated. Do not edit!

// (in-package yolov5_findball.msg)


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
      this.Silos_data = null;
    }
    else {
      if (initObj.hasOwnProperty('Silos_data')) {
        this.Silos_data = initObj.Silos_data
      }
      else {
        this.Silos_data = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Silos
    // Serialize message field [Silos_data]
    bufferOffset = _serializer.string(obj.Silos_data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Silos
    let len;
    let data = new Silos(null);
    // Deserialize message field [Silos_data]
    data.Silos_data = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.Silos_data);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yolov5_findball/Silos';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5bb2bb79514f42a3bb9afaa460ea3556';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string Silos_data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Silos(null);
    if (msg.Silos_data !== undefined) {
      resolved.Silos_data = msg.Silos_data;
    }
    else {
      resolved.Silos_data = ''
    }

    return resolved;
    }
};

module.exports = Silos;
