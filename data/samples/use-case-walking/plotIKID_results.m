clear; clf; clc;

resultsPath = 'results/';

joint_angles = dlmread([resultsPath,'animation.csv']);
joint_torques = dlmread([resultsPath,'IDres_tau.csv']);

subplot(3,1,1);
plot(joint_angles(:,1), joint_angles(:,2:end));
ylabel('Joint Angles (\circ)'); xlabel('Time (s)');

subplot(3,1,2);
plot(joint_angles(:,1), joint_torques(:,1:3));
ylabel('Inverse Dynamics Residuals (Nm)'); xlabel('Time (s)');

subplot(3,1,3);
plot(joint_angles(:,1), joint_torques(:,7:end));
ylabel('Joint Torques (Nm)'); xlabel('Time (s)');