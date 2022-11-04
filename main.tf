resource "google_artifact_registry_repository" "ace-test-repo" {
  location      = "us-central1"
  repository_id = "quickstart-docker-repo"
  description   = "Docker repository"
  format        = "DOCKER"
}

resource "google_cloudbuild_trigger" "ace-test-manual-trigger" {
  name        = "manual-build"

  source_to_build {
    uri             = "https://github.com/ace-n/quickstart-docker"
    ref             = "refs/heads/main"
    repo_type = "GITHUB"
  }

  git_file_source {
    path          = "cloudbuild.yaml"
    uri             = "https://github.com/ace-n/quickstart-docker"
    revision     = "refs/heads/main"
    repo_type = "GITHUB"
  }
}

