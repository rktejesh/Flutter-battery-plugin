// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_battery_plus.dart';
import 'src/enums.dart';
export 'src/enums.dart';

/// The interface that implementations of Battery must implement.
///
/// Platform implementations should extend this class rather than implement it as `Battery`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [BatteryPlatform] methods.
abstract class BatteryPlatform extends PlatformInterface {
  /// Constructs a BatteryPlatform.
  BatteryPlatform() : super(token: _token);

  static final Object _token = Object();

  static BatteryPlatform _instance = MethodChannelBattery();

  /// The default instance of [BatteryPlatform] to use.
  ///
  /// Defaults to [MethodChannelBattery].
  static BatteryPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [BatteryPlatform] when they register themselves.
  static set instance(BatteryPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns the current battery level in percent.
  Future<bool> get isBatteryPresent =>
      throw UnimplementedError('isBatteryPresent() has not been implemented.');

  /// Returns the current battery level in percent.
  Future<int> get batteryLevel =>
      throw UnimplementedError('getBatteryLevel() has not been implemented.');

  /// Returns true if the device is on battery save mode
  Future<bool> get isInBatterySaveMode => throw UnimplementedError(
      'isInBatterySaveMode() has not been implemented.');

  ///Returns the current battery health state
  Future<String> get batteryHealth =>
      throw UnimplementedError('getBatteryHealth() has not been implemented.');

  ///Returns the battery voltage
  Future<int> get batteryCapacity => throw UnimplementedError(
      'getBatteryCapacity() has not been implemented.');

  ///Returns the type of charging plugged
  Future<String> get batteryPluggedType => throw UnimplementedError(
      'getBatteryPluggedType() has not been implemented.');

  ///Returns the battery technology
  Future<String> get batteryTechnology => throw UnimplementedError(
      'getBatteryTechnology() has not been implemented.');

  ///Returns the battery temperature
  Future<double> get batteryTemperature => throw UnimplementedError(
      'getBatteryTemperature() has not been implemented.');

  ///Returns the battery voltage
  Future<int> get batteryVoltage =>
      throw UnimplementedError('getBatteryVoltage() has not been implemented.');

  ///Returns the battery current average while charging
  Future<int> get batteryCurrentAverage => throw UnimplementedError(
      'getBatteryCurrentAverage() has not been implemented.');

  ///Returns the battery current while charging
  Future<int> get batteryCurrentNow => throw UnimplementedError(
      'getBatteryCurrentNow() has not been implemented.');

  ///Returns the remaining battery capacity
  Future<int> get batteryRemainingCapacity => throw UnimplementedError(
      'getBatteryRemainingCapacity() has not been implemented.');

  ///Returns the battery charge time remaining capacity
  Future<int> get batteryChargeTimeRemaining => throw UnimplementedError(
      'getBatteryChargeTimeRemaining() has not been implemented.');

  ///Returns the total battery capacity
  Future<int> get batteryScale =>
      throw UnimplementedError('getBatteryScale() has not been implemented.');

  /// Returns a Stream of BatteryState changes.
  Stream<BatteryState> get onBatteryStateChanged => throw UnimplementedError(
      'get onBatteryStateChanged has not been implemented.');
}
