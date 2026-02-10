# Kiro Configuration

Personal Kiro CLI configuration synced across devices.

## Agents

### Github
GitHub operations agent for repository management, issue tracking, pull request workflows, code search, and user activity monitoring.

**MCP Servers:**
- `github` - GitHub Copilot MCP server

### Ikano
Agent with Atlassian, ServiceNow, and Firebase integration for Jira, Confluence, Compass, ServiceNow operations, and Firebase project management.

**MCP Servers:**
- `atlassian` - Atlassian MCP server (Jira, Confluence, Compass)
- `servicenow` - ServiceNow MCP server
- `firebase` - Firebase CLI MCP server (project management, Firestore, Auth, Storage, Cloud Messaging)

### Job
Agent with Perplexity integration for deep research and web search capabilities.

**MCP Servers:**
- `perplexity` - Perplexity AI MCP server

## Notes

- ServiceNow MCP server requires separate installation (excluded from repo)
- Set required environment variables: `GH_PAT`, `PERPLEXITY_API_KEY`
