#ifndef ROBOCOMPOMNIROBOT_ICE
#define ROBOCOMPOMNIROBOT_ICE

module RoboCompOmniRobot{
	exception HardwareFailedException{string what;};
	["cpp:comparable"]
	struct TMechParams{
		float temp;
		float maxVelAdv;
		float maxVelRot;
		string device;
		string handler;
	};
	["cpp:comparable"]
	struct TBaseState{
		bool isMoving;
		float x;
		float z;
		float alpha;
		float correctedX;
		float correctedZ;
		float correctedAlpha;
		float advVx;
		float advVz;
		float rotV;
	};

	interface OmniRobot{
		void  getBaseState(out TBaseState state)throws HardwareFailedException;
		void  getBasePose(out int x, out int z, out float alpha)throws HardwareFailedException;
		void  setSpeedBase(float advx, float advz, float rot)throws HardwareFailedException;
		void  stopBase()throws HardwareFailedException;
		void  resetOdometer()throws HardwareFailedException;
		void  setOdometer(TBaseState state)throws HardwareFailedException;
		void  setOdometerPose(int x, int z, float alpha)throws HardwareFailedException;
		void  correctOdometer(int x, int z, float alpha)throws HardwareFailedException;
	};
};
  
#endif