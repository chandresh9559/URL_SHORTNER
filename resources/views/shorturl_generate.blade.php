<x-app-layout>
    <div class="container px-4 mt-4">
        <form action="{{route('admin.generateShortUrl')}}" method="POST">
            @csrf
            <h1 class="fw-bold">Generate Short Url</h1>
            <div class="d-flex my-3">
                <div class="form-group me-4">
                    <label for="">Long URL</label><br>
                    <input type="text" name="long_url" class="form-input" placeholder="Please enter the url">
                </div>
            </div>
            <button class="btn btn-primary">Generate</button>
        </form>
    </div>
</x-app-layout>
