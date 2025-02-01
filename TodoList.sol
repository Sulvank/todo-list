// Licencia
// SPDX-License-Identifier: LGPL-3.0-only

// Version 
pragma solidity 0.8.28;

// Contrato
contract TodoList {

    enum State { ToDo, Doing, Done }
    
    struct Task {
        string name;
        string description;
        State state;
    }
    
    mapping(uint256 => Task) private tasks;
    uint256 private taskCount;
    
    event TaskCreated(uint256 indexed id, string name, string description, State state);
    event TaskUpdated(uint256 indexed id, string name, string description, State state);
    event TaskDeleted(uint256 indexed id);
    event TaskListed(uint256 indexed id, string name, string description, State state);
    
    function createTask(string memory _name, string memory _description) external {
        require(bytes(_name).length > 0, "Task name cannot be empty");
        taskCount++;
        tasks[taskCount] = Task(_name, _description, State.ToDo);
        emit TaskCreated(taskCount, _name, _description, State.ToDo);
    }
    
    function updateTask(uint256 _id, string memory _name, string memory _description, State _state) external {
        require(bytes(tasks[_id].name).length > 0, "Task does not exist");
        require(bytes(_name).length > 0, "Task name cannot be empty");
        tasks[_id].name = _name;
        tasks[_id].description = _description;
        tasks[_id].state = _state;
        emit TaskUpdated(_id, _name, _description, _state);
    }
    
    function getTask(uint256 _id) external view returns (string memory, string memory, State) {
        require(bytes(tasks[_id].name).length > 0, "Task does not exist");
        Task memory task = tasks[_id];
        return (task.name, task.description, task.state);
    }
    
    function deleteTask(uint256 _id) external {
        require(bytes(tasks[_id].name).length > 0, "Task does not exist");
        delete tasks[_id];
        emit TaskDeleted(_id);
    }
    
    function listAllTasks() external {
        for (uint256 i = 1; i <= taskCount; i++) {
            if (bytes(tasks[i].name).length > 0) {
                emit TaskListed(i, tasks[i].name, tasks[i].description, tasks[i].state);
            }
        }
    }
}
