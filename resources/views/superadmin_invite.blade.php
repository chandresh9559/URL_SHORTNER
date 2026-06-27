<x-app-layout>
    <div class="container px-4 mt-4">
        <form action="{{route('superadmin.addCompany')}}" method="POST">
            @csrf
            <div class="d-flex my-3">
                <div class="form-group me-4">
                    <label for="">Client Name</label><br>
                    <input type="text" name="name" class="form-input" placeholder="Please enter the name">
                </div>
                <div class="form-group">
                    <label for="">Client Email</label><br>
                    <input type="email" name="email" class="form-input" placeholder="Please enter the email">
                </div>
            </div>
            <button class="btn btn-primary">Send Invitation</button>
        </form>
    </div>
</x-app-layout>
