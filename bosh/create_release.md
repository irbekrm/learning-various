# Create a Bosh release

workflow https://bosh.io/docs/create-release/

`bosh init-release --dir <release-name> --git`

1. Add code/git submodules etc to the /src directory

(`git submodule add <URL>`)

2. `bosh generate-job \<job-name\>` (Multiple jobs might be needed)

3. Create control script (`/jobs/\<job\>/template/ctl.erb) that defines start and stop commands and writes logs and pidfile (`/var/vcap/sys/log/\<job-name\>`, `/var/vcap/sys/run/\<job-name\>/pid` and any other necessary templates. (i.e drain scripts)

4. Create  a monit file for each job

5. Add mappings of templates and where they should be placed on Bosh VMs (relative to `/var/vcap/jobs/\<job-name\>`) to spec file