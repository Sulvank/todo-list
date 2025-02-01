# todo-list
Todo list smart-contract
# **📋 Todo List - Smart Contract for Task Management**

## **📝 Overview**

The **Todo List** is a decentralized application (DApp) implemented in Solidity that allows users to manage their tasks on the blockchain securely and transparently. This smart contract enables users to create, update, retrieve, and delete tasks while maintaining their state.

Designed for simplicity and efficiency, the Todo List smart contract ensures:

- ✅ Task creation with a unique identifier.
- ✅ Secure updating of task details.
- ✅ Efficient retrieval and deletion of tasks.
- ✅ Transparent task listing without redundant storage.

---

## **✨ Features**

1. **📝 Task Management**:

   - Create tasks with a name, description, and initial status.
   - Update task details (name, description, and state).
   - Retrieve task details by ID.
   - Delete tasks when they are no longer needed.

2. **📊 State Handling**:

   - Tasks have predefined states (`ToDo`, `Doing`, `Done`).
   - Ensures data integrity with checks on task existence.

3. **⚡ Efficient Storage**:

   - Uses a mapping structure to optimize task retrieval.

---

## **📖 Contract Summary**

### **Core Functions**

| 🔧 Function Name                             | 📋 Description                                           |
| -------------------------------------------- | -------------------------------------------------------- |
| `createTask(string, string)`                 | Creates a new task with a name and description.          |
| `updateTask(uint256, string, string, State)` | Updates an existing task's name, description, and state. |
| `getTask(uint256)`                           | Retrieves task details by ID.                            |
| `deleteTask(uint256)`                        | Deletes a task if it exists.                             |
| `listAllTasks()`                             | Lists all tasks that have been created and not deleted.  |

---

## **⚙️ Prerequisites**

1. **🛠️ Tools Required**:

   - **🖥️ Remix IDE**: To deploy and test the contract ([Remix IDE](https://remix.ethereum.org)).

2. **🌐 Environment**:

   - Solidity Compiler Version: `0.8.x`.
   - Network: Local blockchain (JavaScript VM) or testnets like Goerli.

---

## **🚀 How to Use the Contract**

### **1️⃣ Deploying the Contract**

1. Open [Remix IDE](https://remix.ethereum.org).
2. Create a new file named `TodoList.sol` and paste the contract code.
3. Navigate to the **Solidity Compiler** tab:
   - Select the compiler version `0.8.x`.
   - Click **✅ Compile TodoList.sol**.
4. Navigate to the **🛠️ Deploy & Run Transactions** tab:
   - Select **Environment** as `Remix VM (Cancun)` for local testing.
   - Deploy the contract by clicking **🚀 Deploy**.

---

### **2️⃣ Using the Contract in Remix**

#### **📝 A. Create a Task**

1. Use the `createTask` function:
   - Input a task name (e.g., `"Buy groceries"`) and a description (`"Go to the supermarket"`).
   - Click **transact**.
   - The task will be assigned a unique ID.

#### **✏️ B. Update a Task**

1. Use the `updateTask` function:
   - Input the task ID, new name, new description, and new state (`0 = ToDo, 1 = Doing, 2 = Done`).
   - Click **transact** to update the task.

#### **🔍 C. Retrieve a Task**

1. Use the `getTask` function:
   - Input the task ID and click **call**.
   - It will return the task's name, description, and state.

#### **🗑️ D. Delete a Task**

1. Use the `deleteTask` function:
   - Input the task ID.
   - Click **transact** to remove the task.

#### **📜 E. List All Tasks**

1. Use the `listAllTasks` function:
   - Click **transact**.
   - It will emit an event with all existing tasks.

---

## **🔍 Code Walkthrough**

### **📂 Key Concepts**

1. **🔐 Task Existence Checks**:

   - Before updating or deleting a task, the contract ensures it exists.

   ```solidity
   require(bytes(tasks[_id].name).length > 0, "Task does not exist");
   ```

2. **📡 Event Logging**:

   - Events like `TaskCreated`, `TaskUpdated`, and `TaskDeleted` provide a transparent record of task actions.

3. **⚡ Gas Efficiency**:

   - Uses a `mapping(uint256 => Task)` to allow direct access to tasks.
   - Eliminates the need for an extra array to track active tasks, reducing storage costs.

---

## **🛠️ Extending the Contract**

### **🌟 Potential Features**

1. **🔑 Access Control**:
   - Implement role-based access to allow only certain users to modify tasks.
2. **📆 Deadline Management**:
   - Add due dates for tasks to track deadlines.
3. **🔄 Task Assignment**:
   - Allow assigning tasks to specific users.
4. **📊 Task Prioritization**:
   - Introduce priority levels for tasks.
5. **🖥️ Front-End Integration**:
   - Develop a UI using React to interact with the smart contract.

---

## **💡 Example Use Cases**

- **📋 Personal Task Management**:
  - Users can store their to-do lists securely on the blockchain.
- **🛠️ Project Management**:
  - Teams can track work progress with immutable task records.
- **🎯 Workflow Automation**:
  - Smart contracts can trigger actions when tasks reach a certain state.

---

## **📜 License**

This project is licensed under the LGPL-3.0-only license. See the LICENSE file for more details.

---

### 🚀 **This Todo List contract is an efficient and decentralized solution for task tracking!**

