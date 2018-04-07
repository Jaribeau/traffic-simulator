% SYDE 322 Project
% Jared Baribeau and Daniel Penner

clc;clear;clf;
nDetectors = 9;
tp = 100;  % Pertrubation timestep

% t,id,vel
data_spd = csvread('sim-020-spd.csv');
data_pert = csvread('sim-020-pert.csv');
% data_flow = csvread('sim-004-flow.csv');
data_formatted_spd = zeros(9,size(data_spd,1)/9,3);
% data_formatted_flow = zeros(9,size(data_flow,1)/9,3);

% Split based on ID
for i=1:nDetectors
    data_formatted_spd(i,:,:) = reshape(data_spd(data_spd(:,2) == i, :), 1, size(data_spd,1)/9, 3);
%     data_formatted_flow(i,:,:) = reshape(data_flow(data_flow(:,2) == i, :), 1, size(data_flow,1)/9, 3);
end

%% Plot speed at each detector over time
figure(1)
for i=1:nDetectors
    hold on;
    subplot(2,1,1)
    plot(data_formatted_spd(i,:,1), smooth(data_formatted_spd(i,:,3),200))
    
end
plot([tp tp], [min(data_formatted_spd(i,:,3)) max(data_formatted_spd(i,:,3))], 'r--')
xlabel('Time (s)');
ylabel('Average Speed (km/h)');


%% Plot flow at each detector over time
% for i=1:nDetectors
%     hold on;
%     subplot(3,1,2)
%     plot(data_formatted_flow(i,:,1), smooth(data_formatted_flow(i,:,3),200))
% end
% plot([tp tp], [min(data_formatted_flow(i,:,3)) max(data_formatted_flow(i,:,3))], 'r--')
% xlabel('Time (s)');
% ylabel('Average Flow (veh/h)');

%% Plot number of cars perturbed over time
subplot(2,1,2)
plot(data_pert(:,1), data_pert(:,2))
hold on;
plot([tp tp], [min(data_pert(:,2)) 100], 'r--')
axis([50 inf 0 100])
xlabel('Time (s)');
ylabel('Number of Perturbed Cars');