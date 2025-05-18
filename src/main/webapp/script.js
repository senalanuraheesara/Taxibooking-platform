function showPanel(panelId) {
    document.querySelectorAll('.panel').forEach(p => p.classList.remove('active'));
    document.getElementById(panelId).classList.add('active');
}

function openForm(type) {
    const container = document.getElementById('adminFormContainer');
    container.innerHTML = `
        <form id="adminForm">
            <label>Username: <input type="text" name="username" required></label><br>
            <label>Password: <input type="password" name="password" required></label><br>
            <label>Role: 
                <select name="role">
                    <option value="RegularAdmin">Regular Admin</option>
                    <option value="SuperAdmin">Super Admin</option>
                </select>
            </label><br>
            <button type="submit">Register</button>
        </form>
    `;

    document.getElementById('adminForm').onsubmit = function (e) {
        e.preventDefault();
        // Here, send data to server via fetch/AJAX
        alert('Admin registered!');
        container.innerHTML = ''; // Clear form
    };
}
