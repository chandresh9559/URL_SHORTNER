<x-app-layout>
    <div class="container px-4 mt-4">
        <form action="{{route('admin.addTeamMember')}}" method="POST">
            @csrf
            <div class="d-flex my-3">
                <div class="form-group me-4">
                    <label for="">Name</label><br>
                    <input type="text" name="name" class="form-input" placeholder="Please enter the name">
                </div>
                <div class="form-group me-4">
                    <label for="">Email</label><br>
                    <input type="email" name="email" class="form-input" placeholder="Please enter the email">
                </div>
                <div class="form-group">
                    <label for="">Role</label><br>
                    <select name="role" id="">
                        <option value="" selected disabled>Select Role</option>
                        <option value="admin">Admin</option>
                        <option value="member">Member</option>
                        <option value="manager">Manager</option>
                        <option value="manager">Sales</option>
                    </select>
                </div>
            </div>
            <button class="btn btn-primary">Send Invitation</button>
        </form>
    </div>
</x-app-layout>
